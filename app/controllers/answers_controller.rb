class AnswersController < ApplicationController


  def create
    delete_errors_a
    delete_errors
    delete_errors_2


    @question = Question.find_by(id: params[:question])
    @answer = @question.answers.build(answer_params)


    @user_question = current_user.answers.build(answer_params)
    @user = current_user


    if @answer.save
      @answer.update_attribute(:username,@user.name)
      @answer.update_attribute(:userreputation,@user.reputation)
      @user_question.save
      @user.reputation == nil ? @user.update_attribute(:reputation,1)  :  @user.update_attribute(:reputation, @user.reputation + 1)
      flash[:success] = "Has respondido correctamente, has ganado un punto de reputación"
      redirect_to @question
    else
      errors_a(@answer)
      redirect_to @question

    end

  end
def sumar


    @answer = Answer.find(params[:id])
    @question = Question.find(params[:question])
    @user = User.find_by(name: @answer.username)
    if logged?

      if @answer.votes
        @answer.update_attribute(:votes,@answer.votes + 1)
        @user.reputation == nil ? @user.update_attribute(:reputation,1)  :  @user.update_attribute(:reputation, @user.reputation + 1)
        @answer.userreputation == nil ? @answer.update_attribute(:userreputation,1)  :  @answer.update_attribute(:userreputation, @answer.userreputation + 1)
        redirect_to @question
      else
        @answer.update_attribute(:votes,1)
        @user.reputation == nil ? @user.update_attribute(:reputation,1)  :  @user.update_attribute(:reputation, @user.reputation + 1)
        @answer.userreputation == nil ? @answer.update_attribute(:userreputation,1)  :  @answer.update_attribute(:userreputation, @answer.userreputation + 1)
        redirect_to @question

      end
    else
      error_v_a
      redirect_to @question

    end

end

  def resta

    @answer = Answer.find(params[:id])
    @question = Question.find(params[:question])
    @user = User.find_by(name: @answer.username)


    if logged?

      if @answer.votes
        @answer.update_attribute(:votes,@answer.votes - 1)
        @user.reputation == nil ? @user.update_attribute(:reputation, -1)  :  @user.update_attribute(:reputation, @user.reputation - 1)
        @answer.userreputation == nil ? @answer.update_attribute(:userreputation, -1)  :  @answer.update_attribute(:userreputation, @answer.userreputation - 1)
        redirect_to @question
      else
        @answer.update_attribute(:votes, -1)
        @user.reputation == nil ? @user.update_attribute(:reputation, -1)  :  @user.update_attribute(:reputation, @user.reputation - 1)
        @answer.userreputation == nil ? @answer.update_attribute(:userreputation, -1)  :  @answer.update_attribute(:userreputation, @answer.userreputation - 1)
        redirect_to @question

      end
    else
      error_v_a
      redirect_to @question

    end

  end

  def answer_params
    params.require(:answer).permit(:content)
  end
end
