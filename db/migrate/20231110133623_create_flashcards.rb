class CreateFlashcards < ActiveRecord::Migration[7.0]
  def change
    create_table :flashcards do |t|
      t.string :title
      t.text :front_content
      t.text :back_content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
