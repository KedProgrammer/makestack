class AddVotesToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :votes, :integer
  end
end
