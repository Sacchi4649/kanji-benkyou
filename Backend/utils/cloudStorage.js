const unggah = require("unggah");
const contentModel = require("../models/contentSchema");

const total = async function () {
  const totalContent = await contentModel.find().count();
  console.log(totalContent);
  return totalContent;
};
const storage = unggah.gcs({
  keyFilename: "./kanji-benkyou-serviceaccount.json",
  bucketName: "kanji-benkyou",
  rename: (req, file) => {
    console.log(file);
    console.log(total);
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
