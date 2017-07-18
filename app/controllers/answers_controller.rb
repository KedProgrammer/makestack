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
      @user_question.update_attribute(:questionid, @question.id)
       @user.update_attribute(:reputation, @user.reputation + 1)
       
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
        flash[:danger] = "Debes tener mas de 5 puntos para votar"
        redirect_to @question


      else
        if !@current_user.qvalidation["#{@answer.id}"]
          @answer.update_attribute(:votes,@answer.votes + 1)
          @user.update_attribute(:reputation, @user.reputation + 1)
          flash[:success] = "Has votado correctamente, el usuario #{@user.name} ha ganado un punto de reputación"
          @hash = @current_user.qvalidation
          @hash["#{@answer.id}"] = true
          @current_user.update_attribute(:qvalidation, @hash)
          redirect_to @question
        else
          flash[:danger] = "Ya has votado esta pregunta"
          redirect_to @question

          
        end
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
        flash[:danger] = "Debes tener mas de 5 puntos para votar"
        redirect_to @question

      else
        if @current_user.qvalidation["#{@answer.id}"]
          @answer.update_attribute(:votes,@answer.votes - 1)
          @user.update_attribute(:reputation, @user.reputation - 1)
          @hash = @current_user.qvalidation
          @hash["#{@answer.id}"] = false
          @current_user.update_attribute(:qvalidation, @hash)
          flash[:success] = "Has quitado el voto correctamente, el usuario #{@user.name} ha perdido un punto de reputación"
          redirect_to @question
        else
          flash[:danger] = "No has votado esta pregunta"
          redirect_to @question


          
        end

        
      end  
    else
      error_v_a
      redirect_to @question

    end
  end


  def edit

    @answer = Answer.find(params[:id])
    
  end



  def update
    @answer = Answer.find(params[:id])
    @question = Question.find(@answer.imageable2_id)
    if @answer.update(answer_params)
      flash[:success] = "Se ha editado la respuesta correctamente"
      redirect_to @question
    else
      render 'edit'

    end
    
  end







  def answer_params
    params.require(:answer).permit(:content)
  end
end
