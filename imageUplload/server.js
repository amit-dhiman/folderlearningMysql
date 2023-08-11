const express = require('express')
const app = express();
const port= 3000;
require('./db/db');
app.use(express.urlencoded({extended:false}));
app.use(express.json());
const uploadModel= require('./models/uploadsModel');

const multer = require('multer');
const path = require('path')
const uploadPath = path.join(__dirname, 'upload');


const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, uploadPath);
  },
  filename: (req, file, cb) => {
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random()*100) + '.jpg';
    cb(null, uniqueSuffix);
  }
});
const upload = multer({ storage: storage });


app.post('/upload', upload.fields([{name:'logo',maxCount:10},{name:'approvedImages',maxCount:10}]),async(req,res)=>{
  try {
    const files = req.files;
    console.log('------------',files);

    const uploadedFiles = [];

    if(files.length){
      for (const file of files) {
      const newFile = new uploadModel({
        logo: file.filename,
        approvedImages: file.filename
      });

      const savedFile = await newFile.save();
      uploadedFiles.push(savedFile);
      }
    }

    // if(files.length){
    //   for (const file of files) {
    //   const newFile = new uploadModel({
    //     approvedImages: file.filename
    //   });

    //   const savedFile = await newFile.save();
    //   uploadedFiles.push(savedFile);
    //   }
    // }

    // const textArea = req.body.textArea;
    // console.log('-------------text------',textArea);

    // if(textArea){
    //   const text = textArea.map((data)=>{
    //     return {textArea:data}
    //   });
    //   let savedText = await uploadModel.create(text);
    // }
    
    res.json("uploadedFiles");
  } catch (err) {
    console.error('Error uploading files:', err);
    res.status(500).json({ error: 'An error occurred while uploading files' });
  }
});



app.listen(port,()=>{
  console.log(`server is listining on ${port}`)
})
