const AuthorModel = require ('../models/authors.model');

const getAll = async (req, res) => {
    try {
        const authors = await AuthorModel.getAll();
        res.json(authors);
    } catch (error) {
        res.status(500).json({
            message: 'Error al recuperar los autores',
            error: error.message
        })
    }
}

const getById = (req, res) => {

}

const create = (req, res) => {

}

module.exports = {
    getAll, 
    getById, 
    create
}