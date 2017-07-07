module CommentsHelper
  def errors(comment)
    session[:error] = comment.errors.full_messages
  end

  def current_errors
    @errors = session[:error]
  end

  def errors?
    !@errors.nil?
  end

  def delete_errors
    session.delete(:error)
    @errors = nil
  end
end
