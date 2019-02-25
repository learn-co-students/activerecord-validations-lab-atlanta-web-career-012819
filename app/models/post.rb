class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait?

  def clickbait?
    unless title.nil?
      unless ["Won't Believe", "Secret", "Top", "Guess"].any? { |text| title.include?(text) }
        errors.add(:title, "must be clickbait")
      end
    end
  end
  
end
