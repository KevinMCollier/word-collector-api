class FlashcardTag < ApplicationRecord
  belongs_to :flashcard
  belongs_to :tag

  validates :flashcard_id, uniqueness: { scope: :tag_id }
end
