class Flashcard < ApplicationRecord
  belongs_to :user
  has_many :flashcard_tags
  has_many :tags, through: :flashcard_tags
end
