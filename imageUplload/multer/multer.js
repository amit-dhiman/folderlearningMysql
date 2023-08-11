// const multer = require('multer');
// const path = require('path')
// const uploadPath= path.join(__dirname,'../upload');
// console.log(uploadPath)

// const storage = multer.diskStorage({
//     destination: function (req, file, cb) {
//       cb(null, uploadPath)
//     },
//     filename: function (req, file, cb) {
//       const uniqueSuffix = Date.now()+ '-' + 'image';
//       cb(null, file.fieldname + '-' + uniqueSuffix)
//     }
// })
  
// module.exports= multer({ storage: storage })
