const { Sequelize, DataTypes, Model } = require("sequelize");
const { sequelize } = require("../config/config");
class Company extends Model {}
Company.init(
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
    ACTIVE: {
      type: DataTypes.BOOLEAN,
      allowNull: true,
      field: "ACTIVE",
    },
    DESCRIPTION: {
        type: DataTypes.TEXT,
        allowNull: true,
        field: "DESCRIPTION",
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
    modelName: "Company",
    tableName: "COMPANY",
    schema: "dbo",
    timestamps: false,

  }
);

module.exports = Company;
