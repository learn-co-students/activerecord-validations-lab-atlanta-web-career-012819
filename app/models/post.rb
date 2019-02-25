class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
  validate :click_bait

  def click_bait
    bait = ["Won't Believe", "Secret", "Top", "Guess"]
    if self.title
      if !bait.any? { |b| self.title.include?(b) }
        errors.add(:title, "Must have clickbaity title!")
      end
    end
  end
end
