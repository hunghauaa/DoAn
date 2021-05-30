const { Sequelize, DataTypes, Model } = require("sequelize");
const { sequelize } = require("../config/config");
class Category extends Model {}
Category.init(
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
    PARENT_ID: {
      type: DataTypes.INTEGER,
      allowNull: true,
      field: "PARENT_ID",
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
    modelName: "Category",
    tableName: "CATEGORY",
    schema: "dbo",
    timestamps: false,

  }
);

module.exports = Category;
