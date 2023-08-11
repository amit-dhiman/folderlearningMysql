const mongoose = require('mongoose');

mongoose.connect('mongodb://127.0.0.1:27017/user')
  .then(() => console.log('database Connected!')).catch((err)=>{
    console.log(`---database err----`,err);
  });