const Delivery_method = require("../models/delivery_method");
module.exports = {
  //   createDeliveryMethod: async (req, res, next) => {
  //     const {
  //       order_progress_id,
  //       payment_method_id,
  //       delivery_method_id,
  //       description,
  //       userId,
  //     } = req.body;
  //     try {
  //       const order = await Order.create({
  //         product_id,
  //         quantity,
  //         user_id: userId,
  //         created_by: userId,
  //       });
  //       if (!Order)
  //         return res
  //           .status(400)
  //           .json({ success: false, message: "create error" });
  //       return res
  //         .status(201)
  //         .json({ success: true, message: "create success", Order });
  //     } catch (error) {
  //       console.log(error);
  //       return res
  //         .status(500)
  //         .json({ success: false, message: "server error", error });
  //     }
  //   },
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
  getAllDeliveryMethod: async (req, res, next) => {
    try {
      let data = await Delivery_method.findAll();
      return res
        .status(200)
        .json({
          success: true,
          data,
          message: "get delivery method successfully",
        });
    } catch (error) {
      console.log(error);
      return res
        .status(500)
        .json({ success: false, message: "server error", error });
    }
  },
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
