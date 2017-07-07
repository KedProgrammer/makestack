class QuestionsController < ApplicationController

  def index
 @questions = Question.all
  end

  def new
    @question  =  Question.new
  end

  def create

    @question = current_user.questions.build(question_params)
    if @question.save
      flash[:success] = "Tu pregunta se ha generado correctamente"
      redirect_to root_path
    else
      render 'new'
    end

  end

  def question_params
    params.require(:question).permit(:tittle,:content)
  end

end
