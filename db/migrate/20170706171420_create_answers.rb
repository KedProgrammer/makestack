class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.text :content
      t.references :imageable, polymorphic: true, index: true

      t.timestamps
    end
    add_index :answers, [:imageable_id, :created_at]
  end
end
