const { Sequelize, DataTypes, Model } = require("sequelize");
const { sequelize } = require("../config/config");
class Company extends Model {}
Company.init(
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
    active: {
      type: DataTypes.BOOLEAN,
      allowNull: true,
      field: "ACTIVE",
    },
    description: {
        type: DataTypes.TEXT,
        allowNull: true,
        field: "DESCRIPTION",
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
    modelName: "Company",
    tableName: "COMPANY",
    schema: "dbo",
    timestamps: false,

  }
);

module.exports = Company;
