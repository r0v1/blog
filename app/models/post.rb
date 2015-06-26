class Post < ActiveRecord::Base

  has_many :comments, dependent: :destroy

  belongs_to :user
  
  validates :title, presence: {message: "Must be provided."},
                    uniqueness: true

  validates :body, uniqueness: {scope: :title}
end
