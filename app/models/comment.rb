class Comment < ActiveRecord::Base

  belongs_to :post
  belongs_to :user

  validates :body, presence: {message: "Must be provided."},
                   uniqueness: true

end
