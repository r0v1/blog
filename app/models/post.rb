class Post < ActiveRecord::Base

  mount_uploader :asset, AssetUploader

  has_many :comments, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :favoriting_users, through: :favorites, source: :user

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  belongs_to :user

  def favorited_by?(user)
    favorites.where(user: user).present?
  end

  def favorite_for(user)
    favorites.find_by_user_id(user)
  end

  def self.search(term)
    where(["body ILIKE ? OR title ILIKE ?", "%#{term}%", "%#{term}%"])
  end

  validates :title, presence: {message: "Must be provided."},
                    uniqueness: true

  validates :body, uniqueness: {scope: :title}
end
