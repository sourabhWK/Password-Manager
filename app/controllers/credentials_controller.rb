class CredentialsController < ApplicationController
  def index
    user = Current.user
    # @credential = Credential.all
    @credential = Credential.where(user_id: user.id)
  end

  def show
    @credential = Credential.find(params[:id])
  end

  def new
    @credential = Credential.new
  end

  def create
    user = Current.user
    pr = params[:credential]
    @credential = Credential.new( website: pr[:website],username:  pr[:username],password: pr[:password],user_id: user.id )

    if @credential.save
      redirect_to user_home_path
    else
      render :new, status: :unprocessable_entity
      puts " Not ---- working =========================="
      puts Current.user.email
    end
  end

  def edit
    @credential = Credential.find(params[:id])
  end

  def update
    @credential = Credential.find(params[:id])

    user = Current.user
    pr = params[:credential]
    if(@credential.update( website: pr[:website],username:  pr[:username],password: pr[:password],user_id: user.id))
      redirect_to @credential
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @credential = Credential.find(params[:id])
    @credential.destroy

    redirect_to root_path, status: :see_other

  end

    def credential_params
      params.require(:credential)
    end
    
end