const { Sequelize, DataTypes, Model } = require("sequelize");
const { sequelize } = require("../config/config");
const Order_detail = require("./order_detail");
const Product = require("../models/products");
class Order extends Model {}
Order.init(
  {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
    },
    order_progress_id: {
      type: DataTypes.INTEGER,
      allowNull: true,
      field: "ORDER_PROGRESS_ID",
    },
    UserId: {
      type: DataTypes.INTEGER,
      allowNull: true,
      field: "USER_ID",
    },
    payment_method_id: {
      type: DataTypes.INTEGER,
      allowNull: true,
      field: "PAYMENT_METHOD_ID",
    },
    delivery_method_id: {
      type: DataTypes.INTEGER,
      allowNull: true,
      field: "DELIVERY_METHOD_ID",
    },
    intoMoney: {
      type: DataTypes.INTEGER,
      allowNull: false,
      field: "INTO_MONEY",
    },
    transportFee: {
      type: DataTypes.INTEGER,
      allowNull: false,
      field: "TRANSPORT_FEE",
    },
    status: {
      type: DataTypes.STRING,
      allowNull: true,
      field: "STATUS",
    },
    description: {
      type: DataTypes.STRING,
      allowNull: true,
      field: "DESCRIPTION",
    },
    created_by: {
      type: DataTypes.INTEGER,
      allowNull: true,
      field: "CREATED_BY",
    },
    updated_at: {
      type: DataTypes.DATE,
      allowNull: true,
      field: "UPDATED_AT",
    },
    created_at: {
      type: DataTypes.DATE,
      allowNull: true,
      field: "CREATED_AT",
    },
    modify_by: {
      type: DataTypes.INTEGER,
      allowNull: true,
      field: "MODIFY_BY",
    },
    deleted: {
      type: DataTypes.DATE,
      allowNull: true,
      field: "DELETED",
    },
  },
  {
    sequelize,
    modelName: "Order",
    tableName: "ORDER",
    schema: "dbo",
    timestamps: false,
  }
);
Order.hasMany(Order_detail);
Order_detail.belongsTo(Order);

module.exports = Order;
