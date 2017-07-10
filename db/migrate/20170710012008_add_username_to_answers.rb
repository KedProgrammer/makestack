class AddUsernameToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :username, :string
  end
end
