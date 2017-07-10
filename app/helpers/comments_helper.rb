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

  def errors_2(comment)
    session[:error_2] = comment.errors.full_messages
  end

  def current_errors_2
    @errors_2 = session[:error_2]
  end

  def errors_2?
    !@errors_2.nil?
  end

  def delete_errors_2
    session.delete(:error_2)
    @errors_2 = nil
  end
end
