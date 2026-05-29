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

const getById = async (req, res) => {
    try {
        const result = await PostModel.getById(req.params.post_id);
        return res.json(result);
    } catch (error) {
        return res.status(500).json({
            message: 'Error al recuperar el post con el ID indicado',
            error: error.message
        })
    }   
}

const getByAuthor = async (req, res) => {
    try {
        const result = await PostModel.getByAuthor(req.params.author_id);
        return res.json(result);
    } catch (error) {
        return res.status(500).json({
            message: 'Error al recuperar los post del autor indicado',
            error: error.message
        })
    }   
}

const create = async (req, res) => {
    try {
        const result = await PostModel.insert(req.body);
        const newPost = await PostModel.getById(result.insertId);

        if(!newPost) {
            return res.status(404).json({
                message: 'No existe post con el ID indicado',
            });
        }
        return res.status(201).json(newPost);
    } catch (error) {
        return res.status(500).json({
            message: 'Error al crear el post',
            error: error.message
        });
    }

}

module.exports = {
    getAll, 
    getById,
    getByAuthor, 
    create
}