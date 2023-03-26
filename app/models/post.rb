# class Post < ApplicationRecord
#   belongs_to :user
#   has_many :favorites, dependent: :destroy
# end

class Post < ApplicationRecord
  belongs_to :user
end