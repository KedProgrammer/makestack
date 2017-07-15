class AnswersController < ApplicationController


  def create
    delete_errors_a
    delete_errors
    delete_errors_2
    delete_errors_r
    
    @question = Question.find_by(id: params[:question])
    @answer = @question.answers.build(answer_params)
    @user_question = current_user.answers.build(answer_params)
    @user = current_user
    if @answer.save
      @answer.update_attribute(:votes,0)
      @answer.update_attribute(:username,@user.name)
      @question.update_attribute(:respuestas,@question.respuestas + 1)
      
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
  delete_errors_a
    delete_errors
    delete_errors_2
    delete_errors_r
    @answer = Answer.find(params[:id])
    @question = Question.find(params[:question])
    @user = User.find_by(name: @answer.username)
    @current_user = current_user
    if logged?
      if @current_user.reputation < 5
        error_r
        redirect_to @question


      else

        @answer.update_attribute(:votes,@answer.votes + 1)
        @user.update_attribute(:reputation, @user.reputation + 1)
        flash[:success] = "Has votado correctamente, el usuario #{@user.name} ha ganado un punto de reputación"
        redirect_to @question
      end  
    else

      error_v_a
      
      redirect_to @question

    end
end





  def resta
    delete_errors_a
    delete_errors
    delete_errors_2
    delete_errors_r

    @answer = Answer.find(params[:id])
    @question = Question.find(params[:question])
    @user = User.find_by(name: @answer.username)
    @current_user = current_user
    if logged?
      if @current_user.reputation < 5
        error_r
        redirect_to @question

      else

        @answer.update_attribute(:votes,@answer.votes - 1)
        @user.update_attribute(:reputation, @user.reputation - 1)
        flash[:success] = "Has votado correctamente, el usuario #{@user.name} ha ganado un punto de reputación"
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
