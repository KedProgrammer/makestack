class AddTagsToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :tags, :string
  end
end
