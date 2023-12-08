# Clear existing data
FlashcardTag.destroy_all
Flashcard.destroy_all
Tag.destroy_all
User.destroy_all

# Create SantaClaus user
santa = User.create!(email: 'santa@northpole.com', username: 'SantaClaus', password: 'HoHoHo123')

# Tags
tags = {
  physics: Tag.create!(name: "Physics"),
  rome: Tag.create!(name: "Ancient Rome"),
  javascript: Tag.create!(name: "JavaScript"),
  holiday: Tag.create!(name: "Holiday Season Fun Facts")
}

# Flashcards
physics_flashcards = [
  { title: 'Newton\'s First Law', front_content: 'State Newton\'s First Law of Motion', back_content: 'An object in motion stays in motion', user: santa, tags: [tags[:physics]] },
  { title: 'Speed of Light', front_content: 'What is the speed of light?', back_content: '299,792,458 meters per second', user: santa, tags: [tags[:physics]] }
]

rome_flashcards = [
  { title: 'Roman Colosseum', front_content: 'What was the Roman Colosseum used for?', back_content: 'Public spectacles, gladiator contests', user: santa, tags: [tags[:rome]] }
]

javascript_flashcards = [
  { title: 'JavaScript Usage', front_content: 'What is JavaScript commonly used for?', back_content: 'Web development', user: santa, tags: [tags[:javascript]] }
]

holiday_flashcards = [
  { title: 'Santa\'s Reindeers', front_content: 'Name Santa\'s most famous reindeer', back_content: 'Rudolph', user: santa, tags: [tags[:holiday]] }
]

# Creating flashcards
[physics_flashcards, rome_flashcards, javascript_flashcards, holiday_flashcards].each do |flashcard_group|
  flashcard_group.each do |flashcard_attrs|
    flashcard = Flashcard.create!(flashcard_attrs.except(:tags))
    flashcard.tags = flashcard_attrs[:tags]
  end
end

puts "Ho Ho Ho"
puts "Database seeded successfully!"
