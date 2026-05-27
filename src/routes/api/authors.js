const { getAll, getById, create } = require('../../controllers/authors.controller');

const router = require('express').Router();

// Rutas de /api/authors
router.get('/', getAll);
router.get('/:author_id', getById);
router.post('/', create);

module.exports = router;