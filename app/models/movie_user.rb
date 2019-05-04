# == Schema Information
#
# Table name: movie_users
#
#  id         :bigint(8)        not null, primary key
#  movie_id   :bigint(8)
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MovieUser < ApplicationRecord
  belongs_to :movie
  belongs_to :user
end
