const db = require('../config/db');

const getAll = async () => {
    const [result] = await db.query(`SELECT * FROM authors`);
    return result;
}

const getById = async (author_id) =>{
    const [result] = await db.query(`SELECT * FROM authors
                                    WHERE id = ?`,
                                    [author_id]);
    if(result.length === 0) return null;
    return result[0];
}

const insert = async ({name, email, image}) => {
    const [result] = await db.query(`INSERT INTO authors 
                                    (name, email, image) 
                                    VALUES(?, ?, ?)`, 
                    [name, email, image]);
    return result;
}

module.exports = {
    getAll, getById, insert
}