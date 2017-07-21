class QuestionsController < ApplicationController


  def index
    delete_errors_a
    delete_errors
    delete_errors_2
    delete_errors_r
    delete_error_v_va
    delete_error
    
    if params[:order] == "nuevas"
     @questions = Question.order(created_at: :desc)
    elsif params[:order] == "masvotadas"
      @questions = Question.order(votes: :desc)
    elsif params[:order] == "masrespuestas"
      @questions = Question.order(respuestas: :desc)     
    else 
      if params[:order].nil?
        if !params["search"].nil?
          @questions = Question.where("tittle = ? ", params["search"]["buscar"])
        else
          @questions = Question.order(created_at: :desc)
        end
      end
      
  
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
      @user.update_attribute(:reputation, @user.reputation + 1)
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
    
    if @question.update(question_params)
      flash[:success] = "Se ha editado la pregunta correctamente"
      redirect_to @question
    else
      render 'edit'

    end
  end



  def edit  
    @question = Question.find(params[:id])
  end  






  def sumar
    @question = Question.find(params[:id])
    @user = @question.user
    @current_user = current_user
    if logged?
      if @current_user.reputation < 5
        flash[:danger] = "Debes tener mas de 5 puntos para votar"
        redirect_to @question
      else
          if !@current_user.qvalidation["#{@question.id}"]

            @question.update_attribute(:votes,@question.votes + 1)
            @user.update_attribute(:reputation, @user.reputation + 1)
            flash[:success] = "Has votado correctamente, el usuario #{@user.name} ha ganado un punto de reputación"
            @hash = @current_user.qvalidation
            @hash["#{@question.id}"] = true
            @current_user.update_attribute(:qvalidation, @hash)
            redirect_to @question
          else
            flash[:danger] = "Ya has votado a esta pregunta"
            redirect_to @question    
          end
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
        flash[:danger] = "Debes tener mas de 5 puntos para votar"
        redirect_to @question
      else 
          if @current_user.qvalidation["#{@question.id}"]  
            @question.update_attribute(:votes,@question.votes - 1)
            @user.update_attribute(:reputation, @user.reputation - 1)
            flash[:success] = "Has quitado voto correctamente, el usuario #{@user.name} ha perdido un punto de reputación"
            @hash = @current_user.qvalidation
            @hash["#{@question.id}"] = false
            @current_user.update_attribute(:qvalidation, @hash)
            redirect_to @question
          else
            flash[:danger] = "No has votado a esta pregunta"
            redirect_to @question
              
          end  
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
