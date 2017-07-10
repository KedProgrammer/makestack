module AnswersHelper

    def errors_a(answer)
      session[:error_a] = answer.errors.full_messages
    end

    def current_errors_a
      @errors_a = session[:error_a]
    end

    def errors_a?
      !@errors_a.nil?
    end

    def delete_errors_a
      session.delete(:error_a)
      @errors_a = nil
    end

end
