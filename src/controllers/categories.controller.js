const CategoryModel = require('../models/categories.model');

const getAll = async (req, res) => {
    try {
        const result = await CategoryModel.getAll();
        return res.json(result);
    } catch (error) {
        return res.status(500).json({
            message: 'Error al recuperar las categorías',
            error: error.message
        })
    }
}

module.exports = {
    getAll
}