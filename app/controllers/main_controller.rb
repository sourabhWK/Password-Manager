class MainController < ActionController::Base
  def index
    if session[:user_id]
      redirect_to user_home_path
    end
  end
end
