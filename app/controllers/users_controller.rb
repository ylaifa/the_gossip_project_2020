class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params.merge(city: City.all.sample))
    if @user.save
      log_in(@user)
      flash[:notice] = "Welcome !"
      redirect_to root_path
    else
      flash[:alert] = @user.errors.full_messages
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @city = City.find_by(name: params[:city])
    if @city == nil
      @city = City.create(name: params[:city])
    end
    @user = User.find(user_params.merge(city: @city)) 
    if @user.update(user_params.merge(city: @city))
      flash[:notice] = "Your account has been updated !"
      redirect_to root_path
    else
      flash[:alert] = @user.errors.full_messages
      render 'new'
    end
  end

  def destroy
    @user = Gossip.find(params[:id])
    @user.destroy

    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :description, :email, :age, :password, :password_confirmation)
  end
end
