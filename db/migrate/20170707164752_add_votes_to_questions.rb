class AddVotesToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :votes, :integer
  end
end
