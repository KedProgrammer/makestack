class CommentsController < ApplicationController


  def create
    delete_errors_a
    delete_errors
    delete_errors_2
    delete_errors_r

    @question = Question.find_by(id: params[:question])
    @user = current_user
    @question.answers.each do |a|
        a.update_attribute(:error,false)

    end


    if params[:answer] == "si"
      @answer = Answer.find_by(id: params[:answer_id])


      @comment = @answer.comments.build(comment_params)
      if @comment.save
        @comment.update_attribute(:username,@user.name)
        

        redirect_to @question
      else
        errors_2(@comment)
        @answer.update_attribute(:error,true)
        redirect_to @question

      end
    elsif params[:answer] == "no"
      byebug
      @comment = @question.comments.build(comment_params)
      if @comment.save
        @comment.update_attribute(:username,@user.name)
        
        redirect_to @question
      else
        errors(@comment)
        redirect_to @question
      end
    end


  end



  def comment_params
    params.require(:comment).permit(:content)
  end
end
