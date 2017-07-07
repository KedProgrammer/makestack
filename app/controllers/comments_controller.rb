class CommentsController < ApplicationController

  def create
    delete_errors

    @question = Question.find_by(id: params[:question])
    @comment = @question.comments.build(comment_params)
    if @comment.save
      redirect_to @question
    else
      errors(@comment)
      redirect_to @question
    end



  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
