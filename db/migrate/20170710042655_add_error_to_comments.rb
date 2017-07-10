class AddErrorToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :error, :boolean
  end
end
