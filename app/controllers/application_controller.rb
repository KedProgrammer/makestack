class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper
  include CommentsHelper
  include AnswersHelper
  include QuestionsHelper
end
