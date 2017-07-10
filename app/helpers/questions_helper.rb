module QuestionsHelper


  def error_v
    delete_error_v_va
    session[:error] = "Debes estar logueado para Votar esta pregunta"
  end

  def error_v?
    !session[:error].nil?
  end

  def delete_error
    session.delete(:error)
  end
end
