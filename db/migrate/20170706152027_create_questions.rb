class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :tittle
      t.text :content

      t.timestamps
    end
    add_index :questions, :created_at, unique:true
  end
end
