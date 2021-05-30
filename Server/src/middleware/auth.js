const jwt = require("jsonwebtoken");
module.exports = async (req, res, next) => {
  const auHeader = req.header("Authorization");
  console.log(auHeader);
  const token = auHeader && auHeader.split(" ")[1];
  if (!token)
    return res.status(401).json({ success: false, message: "Unauthorized " });
  try {
    const tokenValid = await jwt.verify(token, process.env.SECRET_KEY);
    if (!tokenValid)
      return res
        .status(403)
        .json({ success: false, message: "token not valid" });
    req.body.userId = tokenValid.user.id;
    next();
  } catch (error) {
    res.status(500).json({ success: false, message: "server error", error });
  }
};
