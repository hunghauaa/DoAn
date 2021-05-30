const { Sequelize, DataTypes, Model } = require("sequelize");
const { sequelize } = require("../config/config");
class Comment extends Model {}
Comment.init(
  {
    ID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
    },
    PRODUCT_ID: {
      type: DataTypes.INTEGER,
      allowNull: true,
      field: "PRODUCT_ID",
    },
    CONTENT: {
      type: DataTypes.TEXT,
      allowNull: true,
      field: "CONTENT_",
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
    modelName: "Comment",
    tableName: "COMMENT",
    schema: "dbo",
    timestamps: false,

  }
);

module.exports = Comment;
