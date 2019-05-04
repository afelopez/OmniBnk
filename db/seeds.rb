require "faker" # using faker gem
Movie.destroy_all
User.destroy_all
movies = [
  "Buscando a Nemo",
  "Ciudad de Dios",
  "Hable con ella",
  "El Señor de los Anilllos",
  "Kandahar",
  "La mirada de Ulises",
  "Chunking Express",
  "Drunken Master II",
  "Pulp Fiction",
  "Adiós a mi concubina",
  "La lista de Schindler",
  "Leolo",
  "Sin Perdón",
  "Uno de los nuestros",
  "Muerte entre las flores",
  "El decálogo",
  "Nakayan",
  "El cielo sobre Berlín",
  "La mosca",
  "El detective cantante",
  "Avengers: Infinity War",
  "Star Wars: The Force Awakens",
  "Avatar",
  "Titanic",
  "Toy Story 3",
  "Wonder Woman",
  "Iron Man 3"
]
10.times { # 10 users
  u = User.new(username: Faker::Name.unique.first_name, password: "123456", password_confirmation: "123456")
  u.save
  count = 0
  movies.each do |movie| 
    Movie.create(user_id: u.id, like: [true, false].sample, name: movie)
  end
} 