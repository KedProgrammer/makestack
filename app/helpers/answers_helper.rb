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



    def error_v_a
      delete_error
      session[:error_v_a] = "Debes estar logueado para Votar esta pregunta"
    end

    def error_v_a?
      !session[:error_v_a].nil?
    end

  def delete_error_v_va
    session.delete(:error_v_a)
  end

end
