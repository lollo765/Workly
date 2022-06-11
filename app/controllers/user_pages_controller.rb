class UserPagesController < ApplicationController
  
  def index
  end

  def show
    @user= User.find(params[:id])
    @gigs=Gig.where(email: @user.email)
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

  def destroy
    @user = User.find(params[:id])
    @gig = Gig.where(email: @user.email)
    
    @user.destroy
    @gig.destroy

    redirect_to root_path, status: :see_other
  end

  private
  def user_params
    params.permit(:name, :address, :skill, :category, :img)
  end

end
