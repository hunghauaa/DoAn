const { Sequelize, DataTypes, Model } = require("sequelize");
const { sequelize } = require("../config/config");
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

module.exports = User;
