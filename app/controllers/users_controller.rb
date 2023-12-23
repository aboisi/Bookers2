class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
    @newbook = Book.new
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @newbook = Book.new
    @book = Book.new
    
  end

  def edit
    
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to books_path
    end
  end

  def update
    user = User.find(params[:id])
  unless user.id == current_user.id
    redirect_to books_path
  end
    
    @user = User.find(params[:id])
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else 
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
