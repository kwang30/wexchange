class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    if params[:id].nil?
      @user=current_user
    else
      @user=User.find(params[:id])
    end
    @name=@user.first_name+" "+@user.last_name
  end


  def profile
  end

  def index
    @users=User.all
  end



  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome!"
      redirect_to @user
    else
      render 'new'
    end
  end


 private
   def user_params
     params.require(:user).permit(:username, :first_name, :last_name, :email,
                                  :password, :password_confirmation)
   end
end
