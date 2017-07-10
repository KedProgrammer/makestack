class AnswersController < ApplicationController


  def create


    @question = Question.find_by(id: params[:question])
    @answer = @question.answers.build(answer_params)


    @user_question = current_user.answers.build(answer_params)
    @user = current_user


    if @answer.save
      @answer.update_attribute(:username,@user.name)
      @answer.update_attribute(:userreputation,@user.reputation)
      @user_question.save
      flash[:success] = "Has respondido correctamente"
      redirect_to @question
    else
      errors_a(@answer)
      redirect_to @question

    end

  end


  def answer_params
    params.require(:answer).permit(:content)
  end
end
