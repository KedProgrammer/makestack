class AddQvalidationToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :qvalidation, :text
  end
end
