"use strict";

const userModel = require("../models/userSchema");
const {
  passwordEncryption,
  passwordValidation,
} = require("../utils/passwordHandler");
const { generateToken } = require("../utils/jwtHandler");
class UserController {
  static async createUser(request, response, next) {
    try {
      const { username, password } = request.body;
      const user = new userModel({
        username,
        password: passwordEncryption(password),
      });
      await user.save();
      response.status(200).json({ user });
    } catch (error) {
      next(error);
    }
  }

  static async login(request, response, next) {
    try {
      const { username, password } = request.body;
      const findUsername = await userModel.findOne({ username: username });
      if (findUsername) {
        if (passwordValidation(password, findUsername.password)) {
          response.status(200).json({
            message: "Login berhasil",
            token: generateToken({
              id: findUsername._id,
              username: findUsername.username,
            }),
            username: findUsername.username,
          });
        } else {
          response.status(400).json({ message: "Wrong Username/Password" });
        }
      } else {
        response.status(400).json({ message: "Wrong Username/Password" });
      }
    } catch (error) {
      next(error);
    }
  }

  static async getAllUser(request, response, next) {
    try {
      const { limit = 10, offset = 0, search = "" } = request.query;
      const findUser = await userModel
        .find({
          $or: [
            { username: { $regex: new RegExp(search, "i") } },
            { role: { $regex: new RegExp(search, "i") } },
          ],
          isDeleted: false,
        })
        .limit(limit)
        .skip(offset);
      const count = await userModel
        .find({
          $or: [
            { username: { $regex: new RegExp(search, "i") } },
            { role: { $regex: new RegExp(search, "i") } },
          ],
          isDeleted: false,
        })
        .count();
      const pagination = {
        page: offset ? offset / limit + 1 : 1,
        per_page: limit * 1,
        total_data: count,
      };
      response.status(200).json({ user: findUser, pagination });
    } catch (error) {
      next(error);
    }
  }

  static async getOneUser(request, response, next) {
    try {
      const { id } = request.params;
      const findUser = await userModel.findOne({
        _id: id,
        isDeleted: false,
      });

      response.status(200).json({ user: findUser });
    } catch (error) {
      next(error);
    }
  }

  static async editUser(request, response, next) {
    try {
      const { id } = request.params;
      const { username, password } = request.body;
      const findUser = await userModel.findOne({
        _id: id,
        isDeleted: false,
      });

      if (findUser._id == id) {
        const updateUser = await userModel.findOneAndUpdate(
          { _id: id },
          {
            username,
            password,
          },
          {
            new: true,
            upsert: true,
          }
        );
        response.status(200).json({ user: updateUser });
      }
    } catch (error) {
      next(error);
    }
  }

  static async deleteUser(request, response, next) {
    try {
      const { idUser } = request.body;
      const user = await userModel.findOne({ _id: idUser, isDeleted: false });

      if (user._id == idUser) {
        const deleteUser = await userModel.findOneAndUpdate(
          { _id: idUser },
          {
            isDeleted: true,
          },
          {
            new: true,
            upsert: true,
          }
        );
        response.status(200).json({ user: deleteUser });
      }
    } catch (error) {
      next(error);
    }
  }
}

module.exports = UserController;
