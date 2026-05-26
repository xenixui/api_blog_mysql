# API AUTORES

## Recuperar todos los autores
Method: GET 
URL: /api/authors
Headers: -
Body: -

Response: Array con todos los autores

## Recuperar autor por ID
Method: GET 
URL: /api/authors/:author_id
Headers: -
Body: -

Response: Objeto con el autor correspondiente al ID proporcionado

## Crear autor
Method: POST
URL: /api/authors
Headers: Content-Type: application/json
Body: {
  "name": "Nombre del autor",
  "email": "email del autor",
  "image": "URL a la foto del perfil"}

Response: 201 + Datos del nuevo autor (JSON)
  
# API POSTS
## Recuperar todos los posts
Method: GET 
URL: /api/posts
Headers: -
Body: -

Response: Array con todos los posts junto con la información de su autor

## Recuperar posts por autor
Method: GET 
URL: /api/posts/author/:author_id
Headers: -
Body: -

Response: Array con todos los posts escritos por el autor proporcionado

## Crear post
Method: POST
URL: /api/posts
Headers: Content-Type: application/json
Body: {
  "title": "Titulo del post",
  "description": "Texto del post",
  "categories_id": 1,
  "authors_id": 2}

Response: 201 + Datos del nuevo post (JSON)

# API CATEGORIES
## Recuperar todas las categorías
Method: GET 
URL: /api/categories
Headers: -
Body: -

Response: Array con todos las categorías