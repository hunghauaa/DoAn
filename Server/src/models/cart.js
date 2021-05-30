const { Sequelize, DataTypes, Model } = require("sequelize");
const { sequelize } = require("../config/config");
const Product = require("./products");
const User = require("./user");
const Order = require("./order");
class Cart extends Model {}
Cart.init(
  {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
    },
    UserId: {
      type: DataTypes.INTEGER,
      allowNull: true,
      field: "USER_ID",
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
    status: {
      type: DataTypes.STRING,
      allowNull: true,
      field: "STATUS",
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
    updated_at: {
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
    modelName: "Cart",
    tableName: "CART",
    schema: "dbo",
    timestamps: false,
  }
);
// Cart.belongsToMany(Product,{through:'cart'})
// Cart.belongsTo(User)
// Product.belongsToMany(Cart,{through:'product'})
// Cart.hasOne(Product)
// Product.belongsTo(Cart)
Product.hasOne(Cart);
Cart.belongsTo(Product);
module.exports = Cart;
