class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
  validate :true_title

  def true_title
    if self.title == "True Facts"
      errors.add(:title, "You are not allowed to have True Facts as a title")
    end
  end

end
