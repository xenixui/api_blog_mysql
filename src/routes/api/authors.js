const { getAll } = require('../../controllers/authors.controller');

const router = require('express').Router();

// Rutas de /api/authors
router.get('/', getAll);


module.exports = router;