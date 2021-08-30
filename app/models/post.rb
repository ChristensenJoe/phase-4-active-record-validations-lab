class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
    validate :title_must_include_keywords

    def title_must_include_keywords
        unless [/Won't Believe/, /Secret/, /Top \d/, /Guess/].any? { |keyword| keyword.match title}
            errors.add(:title, "Title does not include valid keywords")
        end
    end
end
