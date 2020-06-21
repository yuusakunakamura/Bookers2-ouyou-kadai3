class BooksController < ApplicationController
before_action :baria_user, only: [:edit, :update]
	def new
		@book = Book.new
    end
   
    def create
        @book = Book.new(book_params)
    	@book.user_id = current_user.id
    	 if @book.save

            redirect_to @book, notice: "successfully create book!"
         else
        @books = Book.all
        render 'index'
       end
    end
    def index
    	@book = Book.new
    
        @books = Book.all
    end   
    def show
      @book = Book.find(params[:id])
       @book_comment = BookComment.new

    	 @book = Book.find(params[:id])
         @user = @book.user
         @new_book = Book.new
    end
    def edit
        @book = Book.find(params[:id])
    end
    def update
        @book = Book.find(params[:id])
    if @book.update(book_params)
        redirect_to @book, notice: "successfully update book!"
    else 
        render "edit"
    end

    end
    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path
    end

    private
    def book_params
        params.require(:book).permit(:title, :body, :user_id)
    end
     def baria_user
    unless Book.find(params[:id]).user.id.to_i == current_user.id
        redirect_to books_path
    end
end
end
