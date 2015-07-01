class Comment < ActiveRecord::Base

  belongs_to :post
  belongs_to :user

  def self.search(term)
    where(["body ILIKE ?", "%#{term}%"])
  end


  validates :body, presence: {message: "Must be provided."},
                   uniqueness: true

end
