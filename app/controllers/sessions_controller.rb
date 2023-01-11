class SessionsController < ActionController::Base
  def new
    if session[:user_id]
      redirect_to user_home_path
    end
  end

  def index
    if session[:user_id]
      # Current.user = User.find_by(id: session[:user_id])
      redirect_to credentials_path
    end
  end

  def create
    user = User.find_by(email: params[:email])

    if user.present?  && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_home_path, notice: "Logged In successfully"
    else
      flash[:alert] = "Invalid Email or Password"
      render :new
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out"
  end
end