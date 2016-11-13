class UsersController < ApplicationController
    before_action :correct_user, only: [:edit, :update]
    
    def edit
    end
    
    
    def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Updated your Plofile"
      redirect_to @user
    else
      render 'edit'
    end
  end
    def show # 追加
   @user = User.find(params[:id])
  end
  
   def new
    @user = User.new
  end

 def create
    @user = User.new(user_params)
    if @user.save
        flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
  else
      render 'new'
    end
  end

  private
   def correct_user
  @user = User.find(params[:id])
  
  unless current_user == @user
      redirect_to root_url
    end     
  end

  def user_params
    params.require(:user).permit(:name, :email, :place, :password,
                                 :password_confirmation)
  end
end