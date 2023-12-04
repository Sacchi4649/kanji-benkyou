const mongoose = require("mongoose");

const contentSchema = new mongoose.Schema(
  {
    video: { type: String, default: "" },
    stroke: { type: String, required: false },
    meaning: { type: String, required: false },
    reading: {
      onyomi: { type: String, required: false, default: "-" },
      kunyomi: { type: String, required: false, default: "-" },
    },
    vocabulary: {
      word: { type: String, required: false, default: "" },
      romaji: { type: String, required: false, default: "" },
      wordMeaning: { type: String, required: false, default: "" },
    },
    grade: {
      type: String,
      enum: ["1", "2", "3", "4", "5", "6"],
      required: false,
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
