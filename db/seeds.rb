require "faker" # using faker gem
User.destroy_all
Movie.destroy_all
10.times { # 10 users
  User.create(username: Faker::Name.unique.first_name, password: "123456", password_confirmation: "123456") 
} 
movies = [ # 20 movies
  "Buscando a Nemo",
  "Ciudad de Dios",
  "Hable con ella",
  "El Señor de los Anilllos",
  "Kandahar",
  "La mirada de Ulises",
  "Chunking Express",
  "Drunken Master II",
  "Pulp Fiction",
  "Adiós a mi concubina"
]
movies.each {|movie| Movie.create(name: movie) }# create movies

100.times do # 100 likes
  user = User.all[rand(0...User.all.count)]
  movie = Movie.all[rand(0...Movie.all.count)]
  # where no user has the same movie more than once
  user.movies.include?(movie) ? next : user.movies << movie 
end