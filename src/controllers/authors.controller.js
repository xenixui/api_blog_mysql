const AuthorModel = require ('../models/authors.model');

const getAll = async (req, res) => {
    try {
        const result = await AuthorModel.getAll();
        return res.json(result);
    } catch (error) {
        return res.status(500).json({
            message: 'Error al recuperar los autores',
            error: error.message
        })
    }
}

const getById = async (req, res) => {
    try {
        const result = await AuthorModel.getById(req.params.author_id);
        if(!result) {
            return res.status(404).json({
                message: 'No existe autor con el ID indicado',
            });
        }
        return res.json(result);
    } catch (error) {
        return res.status(500).json({
            message: 'Error al recuperar el autor',
            error: error.message
        });
    }
    
}

const create = async (req, res) => {
    try {
        const result = await AuthorModel.insert(req.body);
        const newAuthor = await AuthorModel.getById(result.insertId);
        
        if(!newAuthor) {
            return res.status(404).json({
                message: 'No existe autor con el ID indicado',
            });
        }
        return res.status(201).json(newAuthor);
    } catch (error) {
        res.status(500).json({
            message: 'Error al crear el autor',
            error: error.message
        });
    }
}

module.exports = {
    getAll, 
    getById, 
    create
}