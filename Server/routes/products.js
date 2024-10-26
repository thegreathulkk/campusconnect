const express = require("express");
const productRouter = express.Router();
const auth = require("../middlewere/auth");
const Product  = require("../models/products");

productRouter.get("/api/products/", auth, async (req, res) => {
  try {
    const products = await Product.find({ category: req.query.category });
    res.json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});


module.exports = productRouter;