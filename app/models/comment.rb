class Comment < ActiveRecord::Base

  belongs_to :post

  validates :body, presence: {message: "Must be provided."},
                   uniqueness: true

end
