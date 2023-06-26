class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'], message: "is not included in the list" }
    validate :sufficiently_clickbait_y
    


    private

    def sufficiently_clickbait_y
        clickbait_phrases = ["Won't Believe", "Secret", "Top", "Guess"]
        unless clickbait_phrases.any? { |phrase| title&.include?(phrase) }
          errors.add(:title, "should be sufficiently clickbait-y")
        end
    end
end
