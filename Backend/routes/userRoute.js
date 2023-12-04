"use strict";

const router = require("express").Router();
const UserController = require("../controllers/userController");
const authentication = require("../middlewares/authentication");

router.post("/login", UserController.login);
router.post("/", authentication, UserController.createUser);
router.get("/", authentication, UserController.getAllUser);
router.get("/:id", authentication, UserController.getOneUser);
router.put("/:id", authentication, UserController.editUser);
router.patch("/delete-user", authentication, UserController.deleteUser);

module.exports = router;
