class Comment < ActiveRecord::Base

  belongs_to :post
  belongs_to :user

  def self.search(term)
    Comment.where(["body ILIKE ?", "%#{term}%"]).order("created_at desc")
  end


  validates :body, presence: {message: "Must be provided."},
                   uniqueness: true

end
