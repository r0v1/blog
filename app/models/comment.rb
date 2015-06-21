class Comment < ActiveRecord::Base

  validates :body, presence: {message: "Must be provided."},
                   uniqueness: true

end
