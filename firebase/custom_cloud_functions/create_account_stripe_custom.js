const functions = require("firebase-functions");
const cors = require("cors")({ origin: true });
const stripe = require("stripe")(functions.config().stripe.secret);

exports.createAccountStripeCustom = functions
  .region("southamerica-east1")
  .runWith({
    timeoutSeconds: 30,
    memory: "512MB",
  })
  .https.onRequest((req, res) => {
    cors(req, res, async () => {
      if (req.method !== "POST") {
        return res
          .status(405)
          .json({ error: "Método não permitido. Use POST." });
      }

      try {
        const data = req.body;

        // Validação de dados
        if (!data.email || !data.firstName || !data.lastName || !data.cpf) {
          return res
            .status(400)
            .json({ error: "Dados obrigatórios ausentes." });
        }

        // Criação da conta no Stripe
        const account = await stripe.accounts.create({
          type: "custom",
          country: "BR",
          email: data.email,
          business_type: "individual",
          capabilities: {
            card_payments: { requested: true },
            transfers: { requested: true },
          },
          business_profile: {
            product_description: data.productDescription || "Serviços",
            mcc: "7399",
            url: "https://seusite.com.br",
          },
          tos_acceptance: {
            date: Math.floor(Date.now() / 1000),
            ip: data.ip || "0.0.0.0",
          },
          individual: {
            first_name: data.firstName,
            last_name: data.lastName,
            dob: {
              day: data.dobDay,
              month: data.dobMonth,
              year: data.dobYear,
            },
            address: {
              line1: data.addressLine1,
              city: data.addressCity,
              state: data.addressState,
              postal_code: data.addressPostalCode,
            },
            phone: data.phone,
            id_number: data.cpf.replace(/\D/g, ""),
          },
        });

        // Criação do link de verificação
        const accountLink = await stripe.accountLinks.create({
          account: account.id,
          refresh_url: "https://seusite.com.br/erro",
          return_url: "https://seusite.com.br/sucesso",
          type: "account_onboarding",
        });

        res.status(200).json({
          success: true,
          accountId: account.id,
          onboardingUrl: accountLink.url, // Mostra pro usuário
        });

        // Retornar os dados ao cliente, incluindo o link para verificação
        return res.status(200).json({
          success: true,
          accountId: account.id,
          verificationUrl: verificationSession.url, // Link que o usuário irá usar para enviar os documentos
          message:
            "Conta criada com sucesso no Stripe e link de verificação gerado.",
        });
      } catch (err) {
        console.error("[Stripe Error]", err.message);
        return res.status(500).json({
          error: "Erro ao criar conta Stripe.",
          details: err.message,
        });
      }
    });
  });
