class UsersController <ApplicationController 
  def new 
    @user = User.new()
  end 

  def show 
    user = User.find(params[:id])
    if authorize(user.id)
      @user = User.find(params[:id])
    else
      flash[:error] = "You don't have access"
      redirect_to root_path
    end
  end 

  def create 
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else  
      flash[:error] = user.errors.full_messages.to_sentence
      redirect_to register_path
    end 
  end 

  def login_form
  end

  def login
   
    user = User.find_by(email: params[:email])
    session[:user_id] = user.id
    cookies[:location] = params[:location]

    if user != nil && user.authenticate(params[:password])
      flash[:success] = "Welcome, #{user.name}"
      redirect_to user_path(user)
    else
      flash[:error] = "Sorry, credentials are bad"
      render :login_form
    end
  end

  def logout
    reset_session
    redirect_to root_path
  end

  private 

  def user_params 
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end 

 
  
end 