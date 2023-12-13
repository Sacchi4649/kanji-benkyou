"use strict";

const router = require("express").Router();
const ContentController = require("../controllers/contentController");
// const  = require("../middlewares/authentication");
// const upload = require("../utils/cloudStorage");

router.post("/", ContentController.addContent);
router.get("/", ContentController.getAllContent);
router.put("/:id", ContentController.updateContent);
router.patch("/:id", ContentController.isDone);
router.delete("/:idContent", ContentController.deleteContent);
module.exports = router;
