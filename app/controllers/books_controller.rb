class BooksController < ApplicationController
  def new
  end
  
  def create
    @newbook = Book.new(book_params)
    @newbook.user_id = current_user.id
    if @newbook.save
      #データが保存された場合
      redirect_to book_path(@newbook.id)
    else
      # バリデーションにより保存できなかった場合
      # indexアクションと同じことしている
      @user = current_user
      @books = Book.all
      render :index
    end
  end 

  def index
    # @book = Book.new
    @newbook = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    # @book = Book.new
    @book = Book.find(params[:id])
    @newbook = Book.new
  end

  def edit
    @newbook = Book.find(params[:id])
    unless @newbook.user_id == current_user.id
      redirect_to books_path
    end
  end
  
  def update
    newbook = Book.find(params[:id])
  unless newbook.user_id == current_user.id
    redirect_to books_path
  end
  
    @newbook = Book.find(params[:id])
    @newbook.user_id = current_user.id
  if @newbook.update(book_params)
    redirect_to book_path(@newbook.id)
  else
    render :edit
  end
  end 
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :image, :body)
  end
end
