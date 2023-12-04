"use strict";

const router = require("express").Router();
const userRoute = require("./userRoute");
const contentRoute = require("./contentRoute");

router.use("/user", userRoute);
router.use("/content", contentRoute);

module.exports = router;
