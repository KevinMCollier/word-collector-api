json.array! @flashcards do |flashcard|
  json.extract! flashcard, :title, :front_content, :back_content
end
