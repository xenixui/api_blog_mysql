const AuthorModel = require ('../models/authors.model');

const getAll = async (req, res) => {
    const authors = await AuthorModel.getAll();
    
}

module.exports = {
    getAll
}