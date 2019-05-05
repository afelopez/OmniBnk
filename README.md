# LA COCREADORA
## Índice
  1. [Instalación en máquina local](#Instalación-en-máquina-local)
## Instalación en máquina local
  Al descargar el repositorio deberás confirgurar la base de datos
  ```
    bundle
    rails db:create
    rails db:migrate
    rails db:seed
  ```
  Con esto habremos generado ademas unos datos iniciales con los que ya podríamos trabajar.  
  A continuación se puede verificar el funcionamiento de la aplicación mediante el uso de **Postman**
___
## SIGN UP
  - Endpoint:  
  ```
    {HOST}/users?username=omnibnk&password=123456&password_confirm=123456
  ```
  - Response:  
  ```
    {
    "id": 171,
    "username": "omnibnk",
    "password_digest": "$2a$10$388o/PhdiZ3zjwL.aNDyw.UvB7bxbQSG2gOxiwvS.XDJNxKYNIMYq",
    "created_at": "2019-05-05T00:14:40.968Z",
    "updated_at": "2019-05-05T00:14:40.968Z"
    }
  ```   
## LOGIN
  - Endpoint:  
  ```
    {HOST}/auth/login?username=omnibnk&password=123456
  ```
  - Response:  
  ```
    {
      "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNzEsImV4cCI6MTU1NzEwMjQ1MH0.DC6hPsA7XqwbDV1JhsollccKAEJFp4qri4IdlekVpAk",
      "exp": "05-05-2019 19:27",
      "username": "omnibnk"
    }
  ```
## Creating a movie
  Para crear una película es necesario:
  1. Estar logueado en la plataforma usando el token para la autenticación.  
  2. Conocer un username para identificar de quien es la película.
  3. Si el usuario no especifica que **le gusta** o **no** la pelicula usando el parámetro *like* que es boolean.
  - Header
  ```
    Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNzAsImV4cCI6MTU1NzA5OTcwM30.deTuaTsErfbVwqPdMBFBXbV_-thF1qIyO2sUUgGiqVU
  ```
  - Endpoint  
  ```
    {HOST}/movies?username=omnibnk&name=UnaPelicula&like=true
  ```
  - Response:  
  ```
    {
      "id": 2424,
      "name": "UnaPelicula",
      "like": true,
      "user_id": 171,
      "created_at": "2019-05-05T00:35:29.489Z",
      "updated_at": "2019-05-05T00:35:29.489Z"
    }
  ```
## Retrieving a movie
  Para recuperar una película es necesario:
  1. Estar logueado en la plataforma usando el token para la autenticación.  
  2. Conocer el identificador de la película.
  - Header
  ```
    Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNzAsImV4cCI6MTU1NzA5OTcwM30.deTuaTsErfbVwqPdMBFBXbV_-thF1qIyO2sUUgGiqVU
  ```
  - Endpoint  
  ```
    {HOST}/movies/2424
  ```
  - Response:  
  ```
    {
      "id": 2424,
      "name": "UnaPelicula",
      "like": true,
      "user_id": 171,
      "created_at": "2019-05-05T00:35:29.489Z",
      "updated_at": "2019-05-05T00:35:29.489Z"
    }
  ```
## Retrieving user movies
  Para recuperar todas las películas de un usuario es necesario:
  1. Estar logueado en la plataforma usando el token para la autenticación.  
  2. Conocer un username para identificar de quien es la película.
  - Header
  ```
    Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNzAsImV4cCI6MTU1NzA5OTcwM30.deTuaTsErfbVwqPdMBFBXbV_-thF1qIyO2sUUgGiqVU
  ```
  - Endpoint  
  ```
    {HOST}/movies?username=omnibnk
  ```
  - Response:  
  ```
    [
      {
        "id": 2426,
        "name": "OtraPeliculaMas",
        "like": false,
        "user_id": 171,
        "created_at": "2019-05-05T00:44:40.287Z",
        "updated_at": "2019-05-05T00:44:40.287Z"
      },
      {
        "id": 2425,
        "name": "OtraPelicula",
        "like": false,
        "user_id": 171,
        "created_at": "2019-05-05T00:44:17.614Z",
        "updated_at": "2019-05-05T00:44:17.614Z"
        "name": "UnaPelicula",
        "like": true,
        "user_id": 171,
        "created_at": "2019-05-05T00:35:29.489Z",
        "updated_at": "2019-05-05T00:35:29
      },
      {
        "id": 2424,
        "name": "UnaPelicula",
        "like": true,
        "user_id": 171,
        "created_at": "2019-05-05T00:35:29.489Z",
        "updated_at": "2019-05-05T00:35:29.489Z"
      }
    ]
  ```
## Updating a movie
  Para actualizar una película es necesario:
  1. Estar logueado en la plataforma usando el token para la autenticación.  
  2. Conocer un username para identificar de quien es la película.
  3. Conocer el identificador de la película.
  4. Los parámetros que voy a actualizar, **Nombe de la pelicula-> name:string** y **Si me gusta o no-> like:boolean**.
  - Header
  ```
    Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNzAsImV4cCI6MTU1NzA5OTcwM30.deTuaTsErfbVwqPdMBFBXbV_-thF1qIyO2sUUgGiqVU
  ```
  - Endpoint  
  ```
    {HOST}/movies/2424?username=omnibnk&name=NuevoNombre&like=false
  ```
  - Response:  
  ```
    {
      "user_id": 171,
      "id": 2424,
      "name": "NuevoNombre",
      "like": false,
      "created_at": "2019-05-05T00:35:29.489Z",
      "updated_at": "2019-05-05T00:51:31.408Z"
    }
  ```
## Deleting a movie
  Para eliminar una película es necesario:
  1. Estar logueado en la plataforma usando el token para la autenticación.  
  2. Conocer un username para identificar de quien es la película.
  3. Conocer el identificador de la película.
  - Header
  ```
    Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNzAsImV4cCI6MTU1NzA5OTcwM30.deTuaTsErfbVwqPdMBFBXbV_-thF1qIyO2sUUgGiqVU
  ```
  - Endpoint  
  ```
    {HOST}/movies/2424?username=omnibank
  ```
  - Response:  
  ```
    {
      "message": "movie was delete"
    }
  ```
## Retrieving recommended movies
  > El sistema de recomendación  determina que tan posible le guste una pelicula a una pesona  
  teniendo en cuenta:  
  Que tantos tanta afinidad tienen los usuarios en sus gustos.  
  Las perlículas que más les gustan a los usuarios en general.  
  ####Importante
  *Esto significa que una persona empezará a tener recomendaciones más precisas siempre y cuando tenga mayor afinidad con los demás usuarios, esto se logra*:  
  **Cuando un usuario crea/califica películas que ya han creado/calificado otros usuarios**

  Para obtener una lista de 5 películas recomendadas es necesario:
  1. Estar logueado en la plataforma usando el token para la autenticación.  
  2. Conocer un username para identificar de quien es la película.
  - Header
  ```
    Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNzAsImV4cCI6MTU1NzA5OTcwM30.deTuaTsErfbVwqPdMBFBXbV_-thF1qIyO2sUUgGiqVU
  ```
  - Endpoint  
  ```
    {HOST}/recommendations?username=omnibnk
  ```
  - Response:  
  ```
    [
      [
        "Nakayan",
        1.0952380952380953
      ],
      [
        "Avengers: Infinity War",
        0.9320679320679321
      ],
      [
        "Pulp Fiction",
        0.9246753246753248
      ],
      [
        "El detective cantante",
        0.9012987012987013
      ],
      [
        "Adiós a mi concubina",
        0.8675324675324676
      ]
    ]
  ```