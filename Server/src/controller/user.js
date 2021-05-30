const express = require("express");
const User = require("../models/user");
const Cart = require("../models/cart");
const Product = require("../models/products");
const Order = require("../models/order");
const OrderDetail = require("../models/order_detail")
const moment = require("moment");
module.exports = {
  getUser: async (req, res, next) => {
    const { id } = req.params;
    if (!id)
      return res.status(400).json({ success: false, message: "invalid id" });
    try {
      let user = await User.findOne({
        include: [{ model: Cart, include: [Product]  }, { model: Order,include: [OrderDetail]  }],
        where: { id },
        attributes: { exclude: "password" },
      });
      if (!user)
        return res
          .status(400)
          .json({ success: false, message: "invalid user" });
      return res
        .status(200)
        .json({ success: true, user, message: "get user successfully" });
    } catch (error) {
      console.log(error);
      return res
        .status(500)
        .json({ success: false, message: "server error", error });
    }
  },
  getAllUser: async (req, res, next) => {
    try {
      let user = await User.findAll({
        attributes: { exclude: "password" },
      });
      if (!user)
        return res
          .status(400)
          .json({ success: false, message: "invalid user" });
      return res
        .status(200)
        .json({ success: true, user, message: "get user successfully" });
    } catch (error) {
      console.log(error);
      return res
        .status(500)
        .json({ success: false, message: "server error", error });
    }
  },
  update: async (req, res, next) => {
    const {
      name,
      email,
      gender,
      date_of_birth,
      address,
      phone_number,
      userId,
    } = req.body;
    console.log(
      name,
      email,
      gender,
      date_of_birth,
      address,
      phone_number,
      userId
    );
    try {
      const data = await User.update(
        {
          name,
          email,
          gender,
          date_of_birth,
          address,
          phone_number,
          updated_at: moment().format("YYYY MM DD"),
          modified_by: userId,
        },
        {
          where: {
            id: req.params.id,
          },
        },
        { multi: true }
      );
      return res
        .status(200)
        .json({ success: true, data, message: "update successful" });
    } catch (error) {
      console.log(error);
      return res
        .status(500)
        .json({ success: false, error, message: "Server error update" });
    }
  },
};
