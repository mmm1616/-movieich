class PostComment < ApplicationRecord
    belongs_to :user
    belongs_to :post_movie
    
    validates :comment, presence: true, length: {maximum: 150, minimum: 2}
end
