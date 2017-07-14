class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.text :content
      t.references :imageable2, polymorphic: true, index: true

      t.timestamps
    end
  end
end

