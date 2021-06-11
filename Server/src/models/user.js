const { Sequelize, DataTypes, Model } = require("sequelize");
const { sequelize } = require("../config/config");
const Cart = require("./cart");
const Product = require("./products");
const Order = require("./order");
const OrderDetail = require("./order_detail")
class User extends Model {}
User.init(
  {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
    },
    username: {
      type: DataTypes.STRING,
      allowNull: true,
      field: "USERNAME",
    },
    password: {
      type: DataTypes.STRING,
      allowNull: true,
      field: "PASSWORD",
    },
    name: {
      type: DataTypes.STRING,
      allowNull: true,
      field: "NAME",
    },
    avatar: {
      type: DataTypes.STRING,
      allowNull: true,
      field: "AVATAR",
    },
    gender: {
      type: DataTypes.STRING,
      allowNull: true,
      field: "GENDER",
    },
    email: {
      type: DataTypes.STRING,
      allowNull: true,
      field: "EMAIL",
    },
    date_of_birth: {
      type: DataTypes.STRING,
      allowNull: true,
      field: "DATE_OF_BIRTH",
    },
    address: {
      type: DataTypes.STRING,
      allowNull: true,
      field: "ADDRESS",
    },
    phone_number: {
      type: DataTypes.STRING,
      allowNull: true,
      field: "PHONE_NUMBER",
    },
    create_by: {
      type: DataTypes.STRING,
      allowNull: true,
      field: "CREATED_BY",
    },
    modified_by: {
      type: DataTypes.STRING,
      allowNull: true,
      field: "MODIFY_BY",
    },
    deleted: {
      type: DataTypes.STRING,
      allowNull: true,
      field: "DELETED",
    },
    updated_at: {
      type: DataTypes.STRING,
      allowNull: true,
      field: "UPDATED_AT",
    },

    role_id: {
      type: DataTypes.STRING,
      allowNull: true,
      field: "ROLE_ID",
    },
  },
  {
    sequelize,
    modelName: "User",
    tableName: "USERS",
    schema: "dbo",
    timestamps: false,
  }
);
User.hasMany(Cart);
User.hasMany(Order);
User.belongsToMany(Product, { through: "cart" });
Product.belongsToMany(User, { through: "cart" });
User.belongsToMany(Order, { through: "cart" });
User.hasMany(Order);
Order.hasMany(OrderDetail)
OrderDetail.belongsTo(Order)


module.exports = User;
