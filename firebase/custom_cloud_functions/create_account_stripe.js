const functions = require("firebase-functions");
const admin = require("firebase-admin");
const cors = require("cors")({ origin: true });
const stripe = require("stripe")(
  "sk_test_51RFCsnGTOG08DTzfkz5Ys0E0ZVE8DpNAanCK05UMfdROFPEXJJFknzpYFMFHVFBZbqSJRsBpAXPetONdcmS7PA9l00IPdgoSuh",
);

exports.createAccountStripe = functions
  .region("southamerica-east1")
  .runWith({
    timeoutSeconds: 10,
    memory: "512MB",
  })
  .https.onRequest((req, res) => {
    cors(req, res, async () => {
      if (req.method !== "POST") {
        return res.status(405).send("Método não permitido. Use POST.");
      }

      try {
        const {
          uid,
          email,
          firstName,
          lastName,
          dobDay,
          dobMonth,
          dobYear,
          addressLine1,
          addressCity,
          addressState,
          addressPostalCode,
          ip,
          bankAccountNumber,
          bankAccountHolderName,
          bankAccountHolderType,
          bankCountry,
          bankCurrency,
          bankRoutingNumber,
        } = req.body;

        if (
          !uid ||
          !email ||
          !firstName ||
          !lastName ||
          !dobDay ||
          !dobMonth ||
          !dobYear ||
          !addressLine1 ||
          !addressCity ||
          !addressState ||
          !addressPostalCode ||
          !ip ||
          !bankAccountNumber ||
          !bankAccountHolderName ||
          !bankAccountHolderType ||
          !bankCountry ||
          !bankCurrency ||
          !bankRoutingNumber
        ) {
          return res
            .status(400)
            .json({ error: "Parâmetros obrigatórios ausentes." });
        }

        const account = await stripe.accounts.create({
          type: "custom",
          country: "BR",
          email: email,
          business_type: "individual",
          capabilities: {
            card_payments: { requested: true },
            transfers: { requested: true },
          },
          individual: {
            first_name: firstName,
            last_name: lastName,
            email: email,
            dob: {
              day: dobDay,
              month: dobMonth,
              year: dobYear,
            },
            address: {
              line1: addressLine1,
              city: addressCity,
              state: addressState,
              postal_code: addressPostalCode,
              country: "BR",
            },
          },
          tos_acceptance: {
            date: Math.floor(Date.now() / 1000),
            ip: ip,
          },
        });

        const externalAccount = await stripe.accounts.createExternalAccount(
          account.id,
          {
            external_account: {
              object: "bank_account",
              country: bankCountry,
              currency: bankCurrency,
              account_holder_name: bankAccountHolderName,
              account_holder_type: bankAccountHolderType,
              account_number: bankAccountNumber,
              routing_number: bankRoutingNumber,
            },
          },
        );

        await admin.firestore().collection("users").doc(uid).set(
          {
            stripeAccountId: account.id,
            stripeAccountType: "custom",
            stripeBankAccountId: externalAccount.id,
          },
          { merge: true },
        );

        return res.status(200).json({
          success: true,
          accountId: account.id,
          bankAccountId: externalAccount.id,
        });
      } catch (error) {
        console.error("Erro Stripe:", error);
        return res.status(500).json({
          success: false,
          error: error.message || "Erro desconhecido.",
        });
      }
    });
  });
