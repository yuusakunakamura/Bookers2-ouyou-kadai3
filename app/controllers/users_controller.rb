class UsersController < ApplicationController
    before_action :baria_user, only: [:edit]
	def index
		@users = User.all
        @user = User.new
        @book = Book.new
	end

	def new
		 @user = User.new
    end
     def update
   @user = User.find(current_user.id)
    if @user.update(user_params)
    redirect_to user_path(current_user.id), notice: "successfully updated user!"
    else
        render "edit"
    end
end
def show
	 @user = User.find(params[:id]) 
     @books = @user.books
     @book = Book.new
end

def edit
    @user = User.find(params[:id])
end

private
    def user_params
        params.require(:user).permit(:name, :profile_image, :introduction)
    end
#url直接防止　メソッドを自己定義してbefore_actionで発動。
   def baria_user
    unless params[:id].to_i == current_user.id
        redirect_to user_path(current_user)
    end
   end


end

