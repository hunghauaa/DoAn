const { Sequelize, DataTypes, Model } = require("sequelize");
const { sequelize } = require("../config/config");
class Category extends Model {}
Category.init(
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
    parentId: {
      type: DataTypes.INTEGER,
      allowNull: true,
      field: "PARENT_ID",
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
    modelName: "Category",
    tableName: "CATEGORY",
    schema: "dbo",
    timestamps: false,

  }
);

module.exports = Category;
