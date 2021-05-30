const { Sequelize, DataTypes, Model } = require("sequelize");
const { sequelize } = require("../config/config");
class Delivery_method extends Model {}
Delivery_method.init(
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
    money: {
      type: DataTypes.INTEGER,
      allowNull: true,
      field: "MONEY",
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
    modelName: "Delivery_method",
    tableName: "DELIVERY_METHOD",
    schema: "dbo",
    timestamps: false,
  }
);

module.exports = Delivery_method;
