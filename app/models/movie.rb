# == Schema Information
#
# Table name: movies
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  like       :boolean
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Movie < ApplicationRecord

  belongs_to :user

  validates :name, presence: true

end
