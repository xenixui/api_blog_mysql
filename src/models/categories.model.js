const db = require('../config/db');

const getAll = async () => {
    const [result] = await db.query(`SELECT * FROM categories`);
    return result;
}

module.exports = {
    getAll
}