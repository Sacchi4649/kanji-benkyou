const mongoose = require("mongoose");

const contentSchema = new mongoose.Schema(
  {
    video: { type: String, default: "" },
    kanji: { type: String, required: true },
    stroke: { type: String, required: true },
    meaning: { type: String, required: true },
    onyomi: { type: String, required: true, default: "-" },
    kunyomi: { type: String, required: true, default: "-" },
    vocabulary: {
      word: { type: String, default: "" },
      romaji: { type: String, default: "" },
      wordMeaning: { type: String, default: "" },
    },
    grade: {
      type: String,
      enum: ["1", "2", "3", "4", "5", "6"],
      required: true,
    },
    isDeleted: {
      type: Boolean,
      required: true,
      default: false,
    },
  },
  { timestamps: true }
);

const Content = mongoose.model("Content", contentSchema);

module.exports = Content;
