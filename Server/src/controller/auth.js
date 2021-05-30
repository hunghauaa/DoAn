const User = require("../models/user");
const argon2 = require("argon2");
const jwt = require("jsonwebtoken");
module.exports = {
  register: async (req, res, next) => {
    const { email, username, password } = req.body;
    if (!username || !password || !email)
      return res
        .status(200)
        .json({ success: false, message: "Vui lòng nhập đủ thông tin" });
    try {
      const user = await User.findOne({ where: { email } });
      console.log(user);
      if (user)
        return res
          .status(200)
          .json({ success: false, message: "Tài khoản đã tồn tại !" });
      //     const salt = await bcrypt.genSalt(10)
      // let hashedPassword = await bcrypt.hash(password, salt);
      const hashedPassword = await argon2.hash(password);
      const newUser = new User({ email, username, password: hashedPassword });
      await newUser.save();
      const accessToken = await jwt.sign(
        { userId: newUser.id },
        process.env.SECRET_KEY,
        { expiresIn: "1800s" }
      );
      res.status(200).json({
        success: true,
        message: "User register success",
        accessToken,
      });
    } catch (error) {
      console.log(error);
      res
        .status(500)
        .json({ success: false, message: "Internal server error" });
    }
  },
  login: async (req, res, next) => {
    try {
      const { email, password } = req.body;
      if (!email || !password)
        return res
          .status(200)
          .json({ success: false, message: "Missing email/password" });
      const user = await User.findOne({ where: { email } });
      if (!user)
        return res
          .status(200)
          .json({ success: false, message: "Error username/password" });

      // return res
      //   .status(200)
      //   .json({ success: true,user, message: "Error username/password" });
      // const passwordDecode =await argon2.verify(user.password,password)
      // console.log(password, user.password);
      // let hashedPasswordSplit = user.password.split("");
      // hashedPasswordSplit[2] = "a";
      // hashedPassword = hashedPasswordSplit.join("");
      const passwordValidate = await argon2.verify(
        `${user.password.split(" ")[0]}`,
        password
      );
      console.log(passwordValidate);

      if (!passwordValidate) {
        return res
          .status(200)
          .json({ success: false, message: "Error username/password1" });
      }

      const token = await jwt.sign({ user }, process.env.SECRET_KEY, {});
      const data = { user, token };
      return res
        .set({
          "Content-Type": "application/json",
          Authorization: "Bearer " + token,
        })
        .status(200)
        .json({ success: true, data, message: "login success" });
    } catch (error) {
      console.log(error);
      return res
        .status(500)
        .json({ success: false, error, message: "Server error" });
    }
  },
};
