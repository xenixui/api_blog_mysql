const db = require('../config/db');

const getAll = async () => {
    const [result] = await db.query('SELECT name, email, image FROM authors');
    return result;
}

module.exports = {
    getAll
}