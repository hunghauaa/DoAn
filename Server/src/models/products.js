const { Sequelize, DataTypes, Model } = require("sequelize");
const { sequelize } = require("../config/config");
const Cart = require("./cart")
class Product extends Model {}
Product.init(
  {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
    },
    name: {
      type: DataTypes.STRING,
      allowNull: true,
      field: "NAME",
    },
    slug: {
      type: DataTypes.STRING,
      allowNull: true,
      field: "SLUG",
    },
    code: {
      type: DataTypes.STRING,
      allowNull: true,
      field: "CODE",
    },
    origin_price: {
      type: DataTypes.FLOAT,
      allowNull: true,
      field: "ORIGIN_PRICE",
    },
    description: {
      type: DataTypes.STRING,
      allowNull: true,
      field: "DESCRIPTION",
    },
    sale: {
      type: DataTypes.INTEGER,
      allowNull: true,
      field: "SALE",
    },
    status: {
      type: DataTypes.STRING,
      allowNull: true,
      field: "STATUS",
    },
    category: {
      type: DataTypes.INTEGER,
      allowNull: true,
      field: "CATEGORY_ID",
    },
    company_id: {
      type: DataTypes.INTEGER,
      allowNull: true,
      field: "COMPANY_ID",
    },
    img1: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    img2: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    img3: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    img4: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    img5: {
      type: DataTypes.STRING, 
      allowNull: true,
    },
    created_by: {
      type: DataTypes.INTEGER,
      allowNull: true,
      field: "CREATED_BY",
    },
    modified_by: {
      type: DataTypes.INTEGER,
      allowNull: true,
      field: "MODIFY_BY",
    },
    updatedAt: {
      type: DataTypes.DATE,
      allowNull: true,
      field: "UPDATED_AT",
    },
    deletedAt: {
      type: DataTypes.DATE,
      allowNull: true,
      field: "DELETED_AT",
    },
  },
  {
    sequelize,
    modelName: "Product",
    tableName: "PRODUCTS",
    paranoid: true,
    schema: "dbo",
    timestamps:false
    // deletedAt: 'deleted'
  }
);
module.exports = Product;
