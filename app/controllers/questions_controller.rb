class QuestionsController < ApplicationController


  def index
    delete_errors_a
    delete_errors
    delete_errors_2
    delete_errors_r
    
    if params[:order] == "nuevas"
     @questions = Question.order(created_at: :desc)
    elsif params[:order] == "masvotadas"
      @questions = Question.order(votes: :desc)
    elsif params[:order] == "masrespuestas"
      @questions = Question.order(respuestas: :desc)     
    elsif params[:order] == nil
      @questions = Question.order(created_at: :desc) 
    end
      @users = User.order(reputation: :desc)
  end



  def new
    @question  =  Question.new
  end




  def create

    @question = current_user.questions.build(question_params)
    @user = current_user
    if @question.save
      @question.update_attribute(:votes,0)
       @question.update_attribute(:respuestas,0)
      flash[:success] = "Tu pregunta se ha generado correctamente, has ganado un punto de reputación"
      @user.reputation == nil ? @user.update_attribute(:reputation,1)  :  @user.update_attribute(:reputation, @user.reputation + 1)
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






  def sumar
    @question = Question.find(params[:id])
    @user = @question.user
    @current_user = current_user
    if logged?
      if @current_user.reputation < 5
        error_r
        redirect_to @question
      else  
        @question.update_attribute(:votes,@question.votes + 1)
        @user.update_attribute(:reputation, @user.reputation + 1)
        flash[:success] = "Has votado correctamente, el usuario #{@user.name} ha ganado un punto de reputación"
        redirect_to @question  
      end  
    else
      error_v
      redirect_to @question
    end
  end






  def resta
    @question = Question.find(params[:id])
    @user = @question.user
    @current_user = current_user
    if logged?
      if @current_user.reputation < 5
        error_r
        redirect_to @question
      else  
        @question.update_attribute(:votes,@question.votes - 1)
        @user.update_attribute(:reputation, @user.reputation - 1)
        flash[:success] = "Has votado negativamente, el usuario #{@user.name} ha perdido un punto de reputación"
        redirect_to @question
      end  
    else
      error_v
      redirect_to @question
    end
  end






  def question_params
    params.require(:question).permit(:tittle,:content)
  end



end
