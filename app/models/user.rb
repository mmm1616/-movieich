class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :post_movies, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  
  has_many :relationships, foreign_key: :following_id, dependent: :destroy
  has_many :followings, through: :relationships, source: :follower
  
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: :follower_id, dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :following
  
  has_one_attached :profile_image
  
  validates :kana_name, uniqueness: true, format: { with: /\A[ぁ-ん]+/ , message: "は全角ひらがなのみが使用できます" }
  validates :user_name, presence: true, uniqueness: true, length: {maximum: 8}
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = 'ゲスト'
      user.kana_name = 'げすと'
      user.user_name = 'ゲスト'
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
  end

  def is_followed_by?(user)#引数(user)にフォローされているか否か
     reverse_of_relationships.find_by(following_id: user.id).present?
     #following_idがuser.idに存在していればtrue
  end
end
