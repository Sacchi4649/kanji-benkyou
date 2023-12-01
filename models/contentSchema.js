const mongoose = require("mongoose");

const contentSchema = new mongoose.Schema(
  {
    video: { type: String, default: "" },
    stroke: { type: String, required: true },
    meaning: { type: String, required: true },
    reading: {
      onyomi: { type: String, required: true, default: "-" },
      kunyomi: { type: String, required: true, default: "-" },
    },
    vocabulary: {
      type: String,
    },
  },
  { timestamps: true }
);

const Content = mongoose.model("Content", contentSchema);

module.exports = Content;
