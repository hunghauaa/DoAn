const Order = require("../models/order");
const Order_detail = require("../models/order_detail");
const { sequelize } = require("../config/config");
const { QueryTypes } = require("sequelize");
const Product = require("../models/products");
module.exports = {
  createOrder: async (req, res, next) => {
    const {
      order_progress_id,
      payment_method_id,
      delivery_method_id,
      intoMoney,
      transportFee,
      description,
      userId,
    } = req.body;
    try {
      const data = await Order.create({
        order_progress_id,
        payment_method_id,
        delivery_method_id,
        intoMoney,
        transportFee,
        description,
        UserId: userId,
        created_by: userId,
      });
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
  getAllOrder: async (req, res, next) => {
    const { userId } = req.body;
    try {
      let data = await Order.findAll({
        include: { model: Order_detail, include: [Product] },
        where: { UserId: userId },
        order: [["created_at", "DESC"]],
      });
      if (!data)
        return res
          .status(400)
          .json({ success: false, message: "invalid Order" });
      return res
        .status(200)
        .json({ success: true, data, message: "get Order successfully" });
    } catch (error) {
      console.log(error);
      return res
        .status(500)
        .json({ success: false, message: "server error", error });
    }
  },
  AdminGetAllOrder: async (req, res, next) => {
    try {
      const data = await sequelize.query(
        `select o.id,o.INTO_MONEY thanhTien,o.TRANSPORT_FEE phiVC,o.DESCRIPTION ghiChu,op.PROGRESS tinhTrang,
        op.ID as trinhTrangId,
        case
          when o.STATUS is not null and o.PAYMENT_METHOD_ID = 2 then N'Đã thanh toán'
          else N'Chưa thanh toán'
          end as thanhToan,
        u.NAME nguoiNhan,u.ADDRESS diaChi,u.PHONE_NUMBER sdt,u.EMAIL email,
        pm.NAME as pttt,
        dm.NAME as ptvc
        from dbo.[ORDER] o
        left join dbo.USERS u on o.USER_ID = u.ID
        left join dbo.PAYMENT_MEDTHOD pm on o.PAYMENT_METHOD_ID = pm.ID
        left join dbo.DELIVERY_METHOD dm on o.DELIVERY_METHOD_ID = dm.ID
        left join dbo.ORDER_PROGRESS op on o.ORDER_PROGRESS_ID = op.ID
        where o.STATUS is null
        order by id desc`,
        {
          type: QueryTypes.SELECT,
        }
      );
      if (!data)
        return res
          .status(400)
          .json({ success: false, message: "invalid Order" });
      return res
        .status(200)
        .json({ success: true, data, message: "get Order successfully" });
    } catch (error) {
      console.log(error);
      return res
        .status(500)
        .json({ success: false, message: "server error", error });
    }
  },
  updateOrder: async (req, res, next) => {
    const { userId, order_progress_id, id,status } = req.body;
    try {
      const data = await Order.update(
        {
          order_progress_id,
          modified_by: userId,
          status

        },
        { where: { id } }
      );
      if (!data)
        return res
          .status(400)
          .json({ success: false, message: "update Order error" });
      return res
        .status(200)
        .json({ success: true, message: "update Order success", data });
    } catch (error) {
      console.log(error);
      return res
        .status(500)
        .json({ success: false, message: "server error", error });
    }
  },
  deleteOrder: async (req, res, next) => {
    const { id } = req.params;
    if (!id)
      return res
        .status(400)
        .json({ success: false, message: "invalid params" });
    try {
      const Order = await Order.destroy({ where: { id } });
      return res.status(200).json({
        success: true,
        message: "delete Order successfully",
        Order,
      });
    } catch (error) {
      console.log(error);
      return res
        .status(500)
        .json({ success: false, message: "server error", error });
    }
  },
};
