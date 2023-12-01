const mongoose = require("mongoose");

const userSchema = new mongoose.Schema(
  {
    username: {
      type: String,
      required: true,
      unique: true,
    },
    password: {
      type: String,
      required: true,
    },
    progress: {
      grade1: { type: Number },
      grade2: { type: Number },
      grade3: { type: Number },
      grade4: { type: Number },
      grade5: { type: Number },
    },
  },
  { timestamps: true }
);

const User = mongoose.model("user", userSchema);

module.exports = User;
