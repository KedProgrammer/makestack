class AddUserreputationToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :userreputation, :integer
  end
end
