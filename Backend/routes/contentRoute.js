"use strict";

const router = require("express").Router();
const ContentController = require("../controllers/contentController");
// const  = require("../middlewares/authentication");
const upload = require("../utils/cloudStorage");

router.post("/", upload.single("video"), ContentController.addContent);
router.get("/", ContentController.getAllContent);
router.put("/:id", ContentController.updateContent);
router.patch("/:id", ContentController.isDone);
module.exports = router;
