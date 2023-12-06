// "use strict";

const contentModel = require("../models/contentSchema");

class ContentController {
  static async addContent(request, response, next) {
    try {
      const {
        video,
        kanji,
        stroke,
        meaning,
        onyomi,
        kunyomi,
        vocabulary,
        grade,
      } = request.body;

      const content = new contentModel({
        video,
        kanji,
        stroke,
        meaning,
        onyomi,
        kunyomi,
        vocabulary,
        grade,
      });
      await content.save();
      response.status(200).json({ content });
    } catch (error) {
      next(error);
    }
  }

  static async getContent(request, response, next) {
    try {
      const { id } = request.params;
      const findContent = await contentModel.findOne({
        _id: id,
        isDeleted: false,
      });
      response.status(200).json({ content: findContent });
    } catch (error) {
      next(error);
    }
  }

  static async getAllContent(request, response, next) {
    try {
      const { limit = 10, offset = 0, search = "ni" } = request.query;
      const findContent = await contentModel
        .find({
          $or: [
            { kanji: { $regex: new RegExp(search, "i") } },
            { onyomi: { $regex: new RegExp(search, "i") } },
            { kunyomi: { $regex: new RegExp(search, "i") } },
          ],
        })
        .limit(limit)
        .skip(offset);
      const count = await contentModel
        .find({
          $or: [
            { kanji: { $regex: new RegExp(search, "i") } },
            { onyomi: { $regex: new RegExp(search, "i") } },
            { kunyomi: { $regex: new RegExp(search, "i") } },
          ],
        })
        .count();
      const pagination = {
        page: offset ? offset / limit + 1 : 1,
        per_page: limit * 1,
        total_data: count,
      };
      response.status(200).json({ content: findContent, pagination });
    } catch (error) {
      next(error);
    }
  }

  // static async editUser(request, response, next) {
  //   try {
  //     const { id } = request.params;
  //     const { username, password } = request.body;
  //     const findUser = await userModel.findOne({
  //       _id: id,
  //       isDeleted: false,
  //     });

  //     if (findUser._id == id) {
  //       const updateUser = await userModel.findOneAndUpdate(
  //         { _id: id },
  //         {
  //           username,
  //           password,
  //         },
  //         {
  //           new: true,
  //           upsert: true,
  //         }
  //       );
  //       response.status(200).json({ user: updateUser });
  //     }
  //   } catch (error) {
  //     next(error);
  //   }
  // }

  // static async deleteUser(request, response, next) {
  //   try {
  //     const { idUser } = request.body;
  //     const user = await userModel.findOne({ _id: idUser, isDeleted: false });

  //     if (user._id == idUser) {
  //       const deleteUser = await userModel.findOneAndUpdate(
  //         { _id: idUser },
  //         {
  //           isDeleted: true,
  //         },
  //         {
  //           new: true,
  //           upsert: true,
  //         }
  //       );
  //       response.status(200).json({ user: deleteUser });
  //     }
  //   } catch (error) {
  //     next(error);
  //   }
  // }
}

module.exports = ContentController;
