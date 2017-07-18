class AddQuestionidToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :questionid, :integer
  end
end
