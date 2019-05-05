module Recommendation
  def recommend_movies

    other_users = User.all.where.not(id: self.id) # find all other users
    recommended = Hash.new(0) # movie list with weight with 0 by default

    other_users.each do |user| #each other user

      other_user_movies_likes = user.movies.where(like: true)
      self_user_movies_likes = self.movies.where(like: true)
      common_movies = other_user_movies_likes.map{|m| m.name} & self_user_movies_likes.map{|m| m.name}
      weight = common_movies.size.to_f / other_user_movies_likes.size # affinity*
      extra_movies =  other_user_movies_likes.where.not(name: common_movies)
      extra_movies.each do |movie| # the extra movies than the other user liked
        recommended[movie.name] += weight # ponderate affinity in the movie
      end
    end
    sorted_recommended = recommended.sort_by { |key, value| value }.reverse # sorting by max affinity
  end
end