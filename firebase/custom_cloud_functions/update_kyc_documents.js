const functions = require("firebase-functions");
const cors = require("cors")({ origin: true });
const stripe = require("stripe")(functions.config().stripe.secret); // Chave secreta do Stripe

exports.updateKycDocuments = functions
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
        if (!data.accountId || !data.fileId) {
          return res
            .status(400)
            .json({ error: 'Campos "accountId" e "fileId" são obrigatórios.' });
        }

        // Atualização do KYC (documento de verificação)
        const account = await stripe.accounts.update(data.accountId, {
          individual: {
            verification: {
              document: {
                front: data.fileId, // O ID do arquivo no Stripe que será usado como documento de verificação
              },
            },
          },
        });

        return res.status(200).json({
          success: true,
          accountId: account.id,
          message: "Documento de verificação atualizado com sucesso.",
        });
      } catch (err) {
        console.error("[Stripe Error]", err.message);
        return res.status(500).json({
          error: "Erro ao atualizar o KYC no Stripe.",
          details: err.message,
        });
      }
    });
  });
