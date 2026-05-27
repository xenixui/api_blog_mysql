const db = require('../config/db');

const getAll = async () => {
    const [result] = await db.query(`SELECT 
                                    posts.id, 
                                    posts.title, 
                                    posts.description, 
                                    categories.name AS category,
                                    authors.name, 
                                    authors.email, 
                                    authors.image,
                                    posts.created_at
                                    FROM posts 
                                    INNER JOIN authors ON posts.authors_id = authors.id
                                    INNER JOIN categories on posts.categories_id = categories.id;`);
    return result;
}

module.exports = {
    getAll
}