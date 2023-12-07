"use strict";

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

  static async getAllContent(request, response, next) {
    try {
      const { limit = 10, offset = 0, search = "二" } = request.query;
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

  static async updateContent(request, response, next) {
    try {
      const { id } = request.params;
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
      const findContent = await contentModel.findOne({
        _id: id,
        isDeleted: false,
      });

      if (findContent._id == id) {
        const updateContent = await contentModel.findOneAndUpdate(
          { _id: id },
          {
            video,
            kanji,
            stroke,
            meaning,
            onyomi,
            kunyomi,
            vocabulary,
            grade,
          },
          {
            new: true,
            upsert: true,
          }
        );
        response.status(200).json({ content: updateContent });
      }
    } catch (error) {
      next(error);
    }
  }

  static async isDone(request, response, next) {
    try {
      const { id } = request.params;

      const findContent = await contentModel.findOne({
        _id: id,
        isDeleted: false,
      });

      let status;
      if (findContent.isDone == false) {
        status = true;
      } else {
        status = false;
      }

      if (findContent._id == id) {
        const isDone = await contentModel.findOneAndUpdate(
          { _id: id },
          {
            isDone: status,
          },
          {
            new: true,
            upsert: true,
          }
        );
        response.status(200).json({ isDone: isDone });
      }
    } catch (error) {
      next(error);
    }
  }
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
