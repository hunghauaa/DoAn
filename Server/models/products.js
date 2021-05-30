const { Sequelize, DataTypes, Model } = require("sequelize");
const { sequelize } = require("../config/config");
class Product extends Model {}
Product.init(
  {
    ID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
    },
    NAME: {
      type: DataTypes.STRING,
      allowNull: true,
      field: "NAME",
    },
    CODE: {
      type: DataTypes.STRING,
      allowNull: true,
      field: "CODE",
    },
    ORIGIN_PRICE: {
      type: DataTypes.FLOAT,
      allowNull: true,
      field: "ORIGIN_PRICE",
    },
    SALE: {
      type: DataTypes.INTEGER,
      allowNull: true,
      field: "SALE",
    },
    STATUS: {
      type: DataTypes.STRING,
      allowNull: true,
      field: "STATUS",
    },
    CATEGORY_ID: {
      type: DataTypes.INTEGER,
      allowNull: true,
      field: "CATEGORY_ID",
    },
    COMPANY_ID: {
      type: DataTypes.INTEGER,
      allowNull: true,
      field: "COMPANY_ID",
    },
    CREATED_BY: {
      type: DataTypes.INTEGER,
      allowNull: true,
      field: "CREATED_BY",
    },
    MODIFY_BY: {
      type: DataTypes.INTEGER,
      allowNull: true,
      field: "MODIFY_BY",
    },
    DELETED: {
      type: DataTypes.DATE,
      allowNull: true,
      field: "DELETED",
    },
  },
  {
    sequelize,
    modelName: "Product",
    tableName: "PRODUCTS",
    schema: "dbo",
    timestamps: false,
  }
);

module.exports = Product;
