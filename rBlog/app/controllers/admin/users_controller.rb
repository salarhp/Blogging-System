class Admin::UsersController < Admin::ApplicationController
  def new
    @page_title = 'Add user'
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice]="user created"
      redirect_to admin_users_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]="user updated"
      redirect_to admin_users_path
    else
      render 'new'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice]="post deleted"
    redirect_to admin_users_path
  end

  def index
    @users = User.all
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
