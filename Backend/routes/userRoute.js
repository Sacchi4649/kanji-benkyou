"use strict";

const router = require("express").Router();
const UserController = require("../controllers/userController");
const authentication = require("../middlewares/authentication");

router.post("/register", UserController.register);
router.post("/login", UserController.login);
router.get("/", UserController.getAllUser);
router.get("/:id", UserController.getOneUser);
router.put("/:id", UserController.editUser);
router.patch("/", UserController.deleteUser);

module.exports = router;
