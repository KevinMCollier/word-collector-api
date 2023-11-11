class CreateFlashcardTags < ActiveRecord::Migration[7.0]
  def change
    create_table :flashcard_tags do |t|
      t.references :flashcard, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end

    add_index :flashcard_tags, [:flashcard_id, :tag_id], unique: true
  end
end
