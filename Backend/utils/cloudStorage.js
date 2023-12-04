const unggah = require("unggah");
// const contentModel = require("../models/contentSchema");

// const totalContent = await contentModel.find().count();
// console.log(totalContent);

const storage = unggah.gcs({
  keyFilename: "./kanji-benkyou-serviceaccount.json",
  bucketName: "kanji-benkyou",
  rename: (req, file) => {
    console.log(file);
    // console.log(totalContent);
    return `${Date.now()}-${file.originalname}`;
  },
});
const upload = unggah({
  //   limits: {
  //     fileSize: 1e15,
  //   },
  storage: storage,
});

module.exports = upload;
