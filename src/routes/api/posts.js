const { getAll, getByAuthor, create, getById } = require('../../controllers/posts.controller');

const router = require('express').Router();

// Rutas de /api/posts
router.get('/', getAll);
router.get('/author/:author_id', getByAuthor);
router.get('/:post_id', getById);
router.post('/', create);

module.exports = router;