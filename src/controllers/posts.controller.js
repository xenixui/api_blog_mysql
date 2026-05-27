const PostModel = require('../models/posts.model');

const getAll = async (req, res) => {
    try {
            const result = await PostModel.getAll();
            return res.json(result);
        } catch (error) {
            return res.status(500).json({
                message: 'Error al recuperar los posts',
                error: error.message
            })
        }
}

const getByAuthor = (req, res) => {

}

const create = (req, res) => {

}

module.exports = {
    getAll, 
    getByAuthor, 
    create
}