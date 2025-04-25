const admin = require("firebase-admin/app");
admin.initializeApp();

const createAccountStripeCustom = require("./create_account_stripe_custom.js");
exports.createAccountStripeCustom =
  createAccountStripeCustom.createAccountStripeCustom;
const updateKycDocuments = require("./update_kyc_documents.js");
exports.updateKycDocuments = updateKycDocuments.updateKycDocuments;
