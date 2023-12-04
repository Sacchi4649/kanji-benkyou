"use strict";

const router = require("express").Router();
const ContentController = require("../controllers/contentController");
// const  = require("../middlewares/");
const upload = require("../utils/cloudStorage");

// router.post("/login", UserController.login);
router.post("/", upload.single("video"), ContentController.addContent);

module.exports = router;
