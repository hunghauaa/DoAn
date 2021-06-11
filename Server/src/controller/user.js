const express = require("express");
const User = require("../models/user");
const Cart = require("../models/cart");
const Product = require("../models/products");
const Order = require("../models/order");
const OrderDetail = require("../models/order_detail");
const moment = require("moment");
module.exports = {
  getUser: async (req, res, next) => {
    const { id } = req.params;
    if (!id)
      return res.status(400).json({ success: false, message: "invalid id" });
    try {
      let user = await User.findOne({
        include: [
          { model: Cart, include: [Product] },
          { model: Order, include: [OrderDetail] },
        ],
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
      let data = await User.findAll({
        attributes: { exclude: "password" },
      });
      if (!data)
        return res
          .status(400)
          .json({ success: false, message: "invalid user" });
      return res
        .status(200)
        .json({ success: true, data, message: "get user successfully" });
    } catch (error) {
      console.log(error);
      return res
        .status(500)
        .json({ success: false, message: "server error", error });
    }
  },
  update: async (req, res, next) => {
    const { name, gender, date_of_birth, address, phone_number, userId,avatar } =
      req.body;
    try {
      const data = await User.update(
        {
          name,
          gender,
          avatar,
          date_of_birth,
          address,
          phone_number,
          updated_at: moment(new Date,'YYYY-MM-DD').format("YYYY-MM-DD"),
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
  deleteUser: async (req, res, next) => {
    try {
      const data = await User.update(
        {
          deleted: moment().format("YYYY MM DD"),
        },
        {
          where: {
            id: req.params.id,
          },
        }
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
