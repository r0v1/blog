class Post < ActiveRecord::Base

  has_many :comments, dependent: :destroy

  validates :title, presence: {message: "Must be provided."},
                    uniqueness: true

  validates :body, uniqueness: {scope: :title}
end
