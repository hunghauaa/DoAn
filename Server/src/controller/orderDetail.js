const Order_detail = require("../models/order_detail");
module.exports = {
  createOrderDetail: async (req, res, next) => {
    // const { OrderId, ProductId, quantity, totalMoney, userId } = req.body;
    try {
      const data = await Order_detail.bulkCreate(req.body);
      if (!data)
        return res
          .status(400)
          .json({ success: false, message: "create error" });
      return res
        .status(201)
        .json({ success: true, message: "create success", data });
    } catch (error) {
      console.log(error);
      return res
        .status(500)
        .json({ success: false, message: "server error", error });
    }
  },
  //   getOrder: async (req, res, next) => {
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
  //   getAllOrder: async (req, res, next) => {
  //     const { userId } = req.params;
  //     try {
  //       let Order = await Order.findAll({ where: { user_id: userId } });
  //       if (!Order)
  //         return res
  //           .status(400)
  //           .json({ success: false, message: "invalid Order" });
  //       return res
  //         .status(200)
  //         .json({ success: true, Order, message: "get Order successfully" });
  //     } catch (error) {
  //       console.log(error);
  //       return res
  //         .status(500)
  //         .json({ success: false, message: "server error", error });
  //     }
  //   },
  //   updateOrder: async (req, res, next) => {
  //     const { quantity, userId } = req.body;
  //     try {
  //       const Order = await Order.update(
  //         {
  //           quantity,
  //           modified_by: userId,
  //         },
  //         { where: { id: req.params.id } }
  //       );
  //       if (!Order)
  //         return res
  //           .status(400)
  //           .json({ success: false, message: "update Order error" });
  //       return res
  //         .status(200)
  //         .json({ success: true, message: "update Order success", Order });
  //     } catch (error) {
  //       console.log(error);
  //       return res
  //         .status(500)
  //         .json({ success: false, message: "server error", error });
  //     }
  //   },
  //   deleteOrder: async (req, res, next) => {
  //     const { id } = req.params;
  //     if (!id)
  //       return res
  //         .status(400)
  //         .json({ success: false, message: "invalid params" });
  //     try {
  //       const Order = await Order.destroy({ where: { id } });
  //       return res.status(200).json({
  //         success: true,
  //         message: "delete Order successfully",
  //         Order,
  //       });
  //     } catch (error) {
  //       console.log(error);
  //       return res
  //         .status(500)
  //         .json({ success: false, message: "server error", error });
  //     }
  //   },
};
