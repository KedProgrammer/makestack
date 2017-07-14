class AddErrorToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :error, :boolean
  end
end
