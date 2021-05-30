const { Sequelize, DataTypes, Model } = require("sequelize");
const { sequelize } = require("../config/config");
const Product = require("../models/products")
class Order_detail extends Model {}
Order_detail.init(
  {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
    },
    OrderId: {
      type: DataTypes.INTEGER,
      allowNull: true,
      field: "ORDER_ID",
    },
    ProductId: {
      type: DataTypes.INTEGER,
      allowNull: true,
      field: "PRODUCT_ID",
    },
    quantity: {
      type: DataTypes.INTEGER,
      allowNull: true,
      field: "QUANTITY",
    },
    totalMoney:{
      type: DataTypes.INTEGER,
      allowNull: false,
      field: "TOTAL_MONEY",
    },  
    createdBy: {
      type: DataTypes.INTEGER,
      allowNull: true,
      field: "CREATED_BY",
    },
    modifiedBy: {
      type: DataTypes.INTEGER,
      allowNull: true,
      field: "MODIFY_BY",
    },
    deletedAt: {
      type: DataTypes.DATE,
      allowNull: true,
      field: "DELETED",
    },
  },
  {
    sequelize,
    modelName: "Order_detail",
    tableName: "ORDER_DETAIL",
    schema: "dbo",
    timestamps: false,
  }
);
Product.hasOne(Order_detail)
Order_detail.belongsTo(Product)
// Order.hasMany(Order_detail)
// Order_detail.belongsTo(Order)
module.exports = Order_detail;
