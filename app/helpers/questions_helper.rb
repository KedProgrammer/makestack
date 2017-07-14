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

  def error_r
    delete_error_v_va
    session[:error_r] = "Debes tener mas de 5 puntos para votar"
  end

  def error_r?
    !session[:error_r].nil?
  end

  def delete_errors_r
    session.delete(:error_r)
  end

  def timer(t)
    aux = t.split(" ")

    if aux.count == 2
      if aux[1] == "minutes"
        aux[1] = "minutos"
      elsif aux[1] == "minute"
        aux[1] = "Minuto"
        else
        aux[1] = "dias"
      end

    elsif aux.count == 3
      aux[0] = "alrededor de "
      aux[2] = "horas"
    elsif aux.count == 4
      aux[0] = "menos"
      aux[1] = "de"
      aux[2] = "un"
      aux[3] = "Minuto"


    end

    aux.join(" ")
  end
end
