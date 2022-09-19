class PostMovie < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :situation
    has_many :post_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
    
    validates :title, presence: true
    validates :situation_id, presence: true
    validates :story, presence: true, length: {maximum: 150, minimum: 2}
    validates :site, presence: true
    validates :review, presence: true, length: {maximum: 150, minimum: 2}

    enum site: { netflix: 0, amazon: 1, unext: 2, hulu: 3, dvd: 4, others: 5 }
    
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
