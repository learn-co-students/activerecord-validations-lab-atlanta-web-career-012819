class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 249}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validate :check_keywords?

# "Won't Believe", "Secret", "Top [number]", or "Guess",
    def check_keywords?
        keywords = [/Won't Believe/, /Secret/, /Top [0-9]*/, /Guess/]
        if keywords.none? {|key| key.match(self.title)}
            errors.add :title, "must contain certain keywords"
        end
    end
end
