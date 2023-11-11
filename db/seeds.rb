# Clear existing data
FlashcardTag.destroy_all
Flashcard.destroy_all
Tag.destroy_all
User.destroy_all

# Users
users_data = [
  { email: 'santa@northpole.com', username: 'SantaClaus', password: 'HoHoHo123' },
  { email: 'rudolph@reindeers.com', username: 'RudolphRedNose', password: 'ShinyNose101' },
  { email: 'frosty@snowman.com', username: 'FrostyTheSnowman', password: 'WinterWonder202' }
]

users = users_data.map do |user_attrs|
  User.create!(user_attrs)
end

# Tags
tags = {
  disney: Tag.create!(name: "Disney Trivia"),
  physics: Tag.create!(name: "Physics"),
  rome: Tag.create!(name: "Ancient Rome"),
  javascript: Tag.create!(name: "JavaScript"),
  holiday: Tag.create!(name: "Holiday Season Fun Facts")
}

# Flashcards
disney_flashcards = [
  { title: 'Mickey Mouse Debut', front_content: 'When did Mickey Mouse first appear?', back_content: 'Steamboat Willie in 1928', user: users.sample, tags: [tags[:disney]] },
  { title: 'Disneyland Opening', front_content: 'What year did Disneyland open?', back_content: '1955', user: users.sample, tags: [tags[:disney]] }
]

physics_flashcards = [
  { title: 'Newton\'s First Law', front_content: 'State Newton\'s First Law of Motion', back_content: 'An object in motion stays in motion', user: users.sample, tags: [tags[:physics]] },
  { title: 'Speed of Light', front_content: 'What is the speed of light?', back_content: '299,792,458 meters per second', user: users.sample, tags: [tags[:physics]] }
]

rome_flashcards = [
  { title: 'Roman Colosseum', front_content: 'What was the Roman Colosseum used for?', back_content: 'Public spectacles, gladiator contests', user: users.sample, tags: [tags[:rome]] }
]

javascript_flashcards = [
  { title: 'JavaScript Usage', front_content: 'What is JavaScript commonly used for?', back_content: 'Web development', user: users.sample, tags: [tags[:javascript]] }
]

holiday_flashcards = [
  { title: 'Santa\'s Reindeers', front_content: 'Name Santa\'s most famous reindeer', back_content: 'Rudolph', user: users.sample, tags: [tags[:holiday]] }
]

# Creating flashcards
[disney_flashcards, physics_flashcards, rome_flashcards, javascript_flashcards, holiday_flashcards].each do |flashcard_group|
  flashcard_group.each do |flashcard_attrs|
    flashcard = Flashcard.create!(flashcard_attrs.except(:tags))
    flashcard.tags = flashcard_attrs[:tags]
  end
end

puts "Database seeded successfully!"
