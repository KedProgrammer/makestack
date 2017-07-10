class RemoveUserIdFromAnswers < ActiveRecord::Migration[5.0]
  def change
    remove_column :answers, :user_id, :integer
  end
end
