class UserPagesController < ApplicationController

  def index
      @user=User.all
  end

  def show
    @user= User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to "/user_pages/" + @user.id
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.permit(:name, :address, :skill, :category, :img)
  end

end
