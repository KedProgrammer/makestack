class AddRespuestasToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :respuestas, :integer
  end
end
