class QuestionsController < ApplicationController

  def index
    delete_errors
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

  def show

@question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.votes
      @question.update_attribute(:votes,@question.votes + 1)
      redirect_to root_path
    else
      @question.update_attribute(:votes,1)
      redirect_to root_path

    end
  end

  def edit
    @question = Question.find(params[:id])
    if @question.votes
      @question.update_attribute(:votes,@question.votes + 1)
      redirect_to @question
    else
      @question.update_attribute(:votes,1)
      redirect_to @question

    end
  end

  def question_params
    params.require(:question).permit(:tittle,:content)
  end



end
