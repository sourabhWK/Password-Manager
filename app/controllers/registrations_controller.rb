class RegistrationsController < ActionController::Base
  def new
    if session[:user_id]
      redirect_to user_home_path
    end
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    begin
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path, notice: "Successfully Created account"
      else
        flash[:alert] = "Something was wrong"
        render :new
      end
    rescue => exception
      exception.message
      puts "Some error occured"
    end
    
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
