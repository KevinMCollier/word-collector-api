json.extract! @flashcard, :id, :title, :front_content, :back_content, :created_at, :updated_at

# If you have associations that you want to include, you can add them similarly
# For example, if flashcards have comments or other related models, you can add them here
# json.comments @flashcard.comments do |comment|
#   json.extract! comment, :id, :content
# end
