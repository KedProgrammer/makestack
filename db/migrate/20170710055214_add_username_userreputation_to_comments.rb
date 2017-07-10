class AddUsernameUserreputationToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :username, :string
    add_column :comments, :userreputation, :integer
  end
end
