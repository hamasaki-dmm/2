class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :proper_user_users, only: [:edit, :update]

  def index
  	@users = User.all
  	@new_book = Book.new
  end

  def show
  	@user = User.find(params[:id])
  	@new_book = Book.new
    @user_books = @user.books
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "You have updated user successfully."
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :introduction, :profile_image)
    end

    def proper_user_users
      @user = User.find(params[:id])
      if current_user != @user
        redirect_to user_path(current_user)
      end
    end
end
