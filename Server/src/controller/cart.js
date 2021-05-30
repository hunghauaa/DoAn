const Cart = require("../models/cart");
const Product = require("../models/products");
const { Op } = require("sequelize");
module.exports = {
  createCart: async (req, res, next) => {
    const { product_id, quantity, userId } = req.body;
    console.log(req.body);
    try {
      const cart = await Cart.create({
        ProductId: product_id,
        quantity,
        UserId: userId,
        created_by: userId,
      });
      if (!cart)
        return res
          .status(400)
          .json({ success: false, message: "create error" });
      return res
        .status(201)
        .json({ success: true, message: "create success", cart });
    } catch (error) {
      console.log(error);
      return res
        .status(500)
        .json({ success: false, message: "server error", error });
    }
  },
  //   getCart: async (req, res, next) => {
  //     const { id } = req.params;
  //     if (!id)
  //       return res
  //         .status(400)
  //         .json({ success: false, message: "invalid params" });
  //     try {
  //       const product = await Product.findOne({ where: { id } });
  //       return res
  //         .status(200)
  //         .json({ success: true, message: "get product successfully", product });
  //     } catch (error) {
  //       console.log(error);
  //       return res
  //         .status(500)
  //         .json({ success: false, message: "server error", error });
  //     }
  //   },
  getAllCart: async (req, res, next) => {
    const { userId } = req.body;
    try {
      let data = await Cart.findAll({
        include: Product,
        where: { UserId: userId },
      });
      if (!data)
        return res
          .status(400)
          .json({ success: false, message: "invalid cart" });
      return res
        .status(200)
        .json({ success: true, data, message: "get cart successfully" });
    } catch (error) {
      console.log(error);
      return res
        .status(500)
        .json({ success: false, message: "server error", error });
    }
  },
  checkCartExisted: async (req, res, next) => {
    const { userId } = req.body;
    try {
      let data = await Cart.findOne({
        where: {
          [Op.and]: [{ UserId: userId }, { ProductId: req.params.id }],
        },
      });
      if (!data)
        return res
          .status(200)
          .json({ success: true, message: "cart don't exist"});
      return res
        .status(200)
        .json({ success: true, data, message: "get cart successfully" });
    } catch (error) {
      console.log(error);
      return res
        .status(500)
        .json({ success: false, message: "server error", error });
    }
  },
  updateCart: async (req, res, next) => {
    const { quantity, userId } = req.body;
    try {
      const cart = await Cart.update(
        {
          quantity,
          modified_by: userId,
        },
        { where: { id: req.params.id } }
      );
      if (!cart)
        return res
          .status(400)
          .json({ success: false, message: "update cart error" });
      return res
        .status(200)
        .json({ success: true, message: "update cart success", cart });
    } catch (error) {
      console.log(error);
      return res
        .status(500)
        .json({ success: false, message: "server error", error });
    }
  },
  updateCartCheckout: async (req, res, next) => {
    const { status, userId, id } = req.body;
    try {
      const cart = await Cart.update(
        {
          status,
          modified_by: userId,
        },
        {
          where: {
            id: {
              [Op.in]: id,
            },
          },
        }
      );
      if (!cart)
        return res
          .status(400)
          .json({ success: false, message: "update cart error" });
      return res
        .status(200)
        .json({ success: true, message: "update cart success", cart });
    } catch (error) {
      console.log(error);
      return res
        .status(500)
        .json({ success: false, message: "server error", error });
    }
  },
  clearCartCheckout: async (req, res, next) => {
    const { userId } = req.body;
    try {
      const cart = await Cart.update(
        {
          status: null,
          modified_by: userId,
        },
        {
          where: {
            UserId: userId,
          },
        }
      );
      if (!cart)
        return res
          .status(400)
          .json({ success: false, message: "update cart error" });
      return res
        .status(200)
        .json({ success: true, message: "update cart success", cart });
    } catch (error) {
      console.log(error);
      return res
        .status(500)
        .json({ success: false, message: "server error", error });
    }
  },
  deleteCart: async (req, res, next) => {
    console.log(typeof req.body.id);
    if (typeof req.body.id == typeof 1) {
      id = [req.body.id];
    } else {
      id = req.body.id;
    }
    // const { id } = req.params;
    // if (!id)
    //   return res
    //     .status(400)
    //     .json({ success: false, message: "invalid params" });
    try {
      const cart = await Cart.destroy({
        where: {
          id: {
            [Op.in]: [...id],
          },
        },
      });
      return res.status(200).json({
        success: true,
        message: "delete cart successfully",
        cart,
      });
    } catch (error) {
      console.log(error);
      return res
        .status(500)
        .json({ success: false, message: "server error", error });
    }
  },
};
