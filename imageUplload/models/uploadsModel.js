const mongoose = require('mongoose');
const Schema = mongoose.Types.Schema;

const uploadsModel = new mongoose.Schema({
  logo: {
    type: String
  },

  approvedImages: {
    type: String
  },

  textArea: {
    type: String
  },
});

module.exports = mongoose.model('uploads', uploadsModel);
