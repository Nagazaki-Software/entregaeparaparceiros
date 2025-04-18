const admin = require("firebase-admin/app");
admin.initializeApp();

const createStripeAccountCustom = require("./create_stripe_account_custom.js");
exports.createStripeAccountCustom =
  createStripeAccountCustom.createStripeAccountCustom;
const createAccountStripe = require("./create_account_stripe.js");
exports.createAccountStripe = createAccountStripe.createAccountStripe;
