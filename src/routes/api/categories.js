const { getAll } = require('../../controllers/categories.controller');

const router = require('express').Router();

// Rutas de /api/categories
router.get('/', getAll);

module.exports = router;