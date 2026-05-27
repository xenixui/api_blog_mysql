const router = require('express').Router();

// Rutas de /api
router.use('/authors', require('./api/authors'));
router.use('posts', require('./api/posts'));
router.use('categories', require('./api/categories'));

module.exports = router;