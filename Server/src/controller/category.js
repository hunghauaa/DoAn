const Category = require("../models/category");

module.exports = {
  create: async (req, res, next) => {
    const { name, parentId, userId } = req.body;
    try {
      const data = await Category.create({
        name,
        parentId,
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
  // getProduct: async (req, res, next) => {
  //   const { id } = req.params;
  //   if (!id)
  //     return res
  //       .status(400)
  //       .json({ success: false, message: "invalid params" });
  //   try {
  //     const data = await Product.findOne({ where: { id } });
  //     return res
  //       .status(200)
  //       .json({ success: true, message: "get product successfully", data });
  //   } catch (error) {
  //     console.log(error);
  //     return res
  //       .status(500)
  //       .json({ success: false, message: "server error", error });
  //   }
  // },
  getAllCategory: async (req, res, next) => {
    try {
      let data = await Category.findAll();
      return res
        .status(200)
        .json({ success: true, data, message: "get category successfully" });
    } catch (error) {
      console.log(error);
      return res
        .status(500)
        .json({ success: false, message: "server error", error });
    }
  },
  // update: async (req, res, next) => {
  //   const {
  //     name,
  //     code,
  //     origin_price,
  //     description,
  //     sale,
  //     category,
  //     company_id,
  //     userId,
  //   } = req.body;
  //   try {
  //     const product = await Product.update(
  //       {
  //         name,
  //         code,
  //         code,
  //         origin_price,
  //         description,
  //         sale,
  //         category,
  //         company_id,
  //         created_by: userId,
  //       },
  //       { where: { id: req.params.id } }
  //     );
  //     if (!product)
  //       return res
  //         .status(400)
  //         .json({ success: false, message: "update error" });
  //     return res
  //       .status(200)
  //       .json({ success: true, message: "update success", product });
  //   } catch (error) {
  //     console.log(error);
  //     return res
  //       .status(500)
  //       .json({ success: false, message: "server error", error });
  //   }
  // },
  delete: async (req, res, next) => {
    const { id } = req.params;
    if (!id)
      return res
        .status(400)
        .json({ success: false, message: "invalid params" });
    try {
      const data = await Category.destroy({ where: { id } });
      return res.status(200).json({
        success: true,
        message: "delete product successfully",
        data,
      });
    } catch (error) {
      console.log(error);
      return res
        .status(500)
        .json({ success: false, message: "server error", error });
    }
  },
};
