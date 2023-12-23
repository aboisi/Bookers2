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
    @newbook = User.find(params[:id])
    unless @newbook == current_user
      redirect_to books_path
    end
  end

  def update
    user = User.find(params[:id])
  unless user.id == current_user.id
    redirect_to books_path
  end

    @newbook = User.find(params[:id])
    @newbook = current_user
    if @newbook.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@newbook.id)
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
