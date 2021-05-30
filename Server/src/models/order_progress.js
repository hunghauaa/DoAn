const { Sequelize, DataTypes, Model } = require("sequelize");
const { sequelize } = require("../config/config");
class Order_progress extends Model {}
Order_progress.init(
  {
    ID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
    },
    PROGRESS: {
      type: DataTypes.STRING,
      allowNull: true,
      field: "PROGRESS",
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
    modelName: "Order_progress",
    tableName: "ORDER_PROGRESS",
    schema: "dbo",
    timestamps: false,
  }
);

module.exports = Order_progress;
