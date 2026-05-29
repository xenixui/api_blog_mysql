const db = require('../config/db');

const getAll = async () => {
    const [result] = await db.query(`SELECT 
                                    posts.id, 
                                    posts.title, 
                                    posts.description, 
                                    categories.name AS category,
                                    authors.name as author, 
                                    authors.email as author_email, 
                                    authors.image as author_image,
                                    posts.created_at
                                    FROM posts 
                                    INNER JOIN authors ON posts.authors_id = authors.id
                                    INNER JOIN categories on posts.categories_id = categories.id;`);
    return result;
}

const getById = async (post_id) => {
    const [result] = await db.query(`SELECT 
                                    posts.id, 
                                    posts.title, 
                                    posts.description, 
                                    categories.name AS category,
                                    authors.name as author, 
                                    authors.email as author_email, 
                                    authors.image as author_image,
                                    posts.created_at
                                    FROM posts 
                                    INNER JOIN authors ON posts.authors_id = authors.id
                                    INNER JOIN categories on posts.categories_id = categories.id
                                    WHERE posts.id = ?;`,
                                    [post_id]);
    if(result.length === 0) return null;
    return result[0];
}

const getByAuthor = async (author_id) => {
    const [result] = await db.query(`SELECT
                                    posts.id, 
                                    posts.title, 
                                    posts.description,
                                    categories.name AS category,
                                    authors.name as author, 
                                    authors.email as author_email, 
                                    authors.image as author_image,
                                    posts.created_at
                                    FROM posts 
                                    INNER JOIN authors ON posts.authors_id = authors.id
                                    INNER JOIN categories on posts.categories_id = categories.id
                                    WHERE authors.id = ?;`,
                                    [author_id]);
if(result.length === 0) return null;
return result;
}

const insert = async ({title, description, categories_id, authors_id}) => {
    const [result] = await db.query (`INSERT INTO posts
                                    (title, description, categories_id, authors_id)
                                    VALUES (?, ?, ?, ?)`,
                                [title, description, categories_id, authors_id]);
    return result
}

module.exports = {
    getAll, 
    getById,
    getByAuthor, 
    insert
}