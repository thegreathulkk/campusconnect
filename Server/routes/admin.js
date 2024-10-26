const express = require("express");
const adminRouter = express.Router();
const admin = require("../middlewere/admin");
const { Product } = require("../models/products");
const { Event } = require("../models/event");
const { PromiseProvider } = require("mongoose");

// Add product
adminRouter.post("/admin/add-product", admin, async (req, res) => {
  try {
    const { name, description, price, category } = req.body;
    let product = new Product({
      name,
      description,
      //vendor,
      price,
      category,
    });
    product = await product.save();
    res.json(product);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//Get all your products
adminRouter.get("/admin/get-products", admin, async (req, res) => {
  try {
    const products = await Product.find({});
    res.json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//Delete the product
adminRouter.post("/admin/delete-product", admin, async (req, res) => {
  try {
    const { id } = req.body;
    let product = await Product.findByIdAndDelete(id);
    res.json(product);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//event Logic


// Add event
adminRouter.post("/admin/add-event", admin, async (req, res) => {
  try {
    const { name, description, author, location, date, category } = req.body;
    let event = new Event({
      name,
      description,
      author,
      location,
      date,
      category,
    });
    event = await event.save(); 
    res.json(event);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// Get all your events
adminRouter.get("/admin/get-events", admin, async (req, res) => {
  try {
    const events = await Event.find({});
    res.json(events);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// Delete the event
adminRouter.post("/admin/delete-event", admin, async (req, res) => {
  try {
    const { id } = req.body;
    let event = await Event.findByIdAndDelete(id);
    res.json(event);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});


module.exports = adminRouter;
