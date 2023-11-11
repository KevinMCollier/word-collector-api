class Tag < ApplicationRecord
  has_many :flashcard_tags
  has_many :flashcards, through: :flashcard_tags
end
