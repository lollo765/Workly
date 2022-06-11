class WorkersController < ApplicationController
  def index
    if (params[:search].blank? && params[:category].blank? && params[:skill].blank?)
      @users=User.all
    elsif (!params[:category].blank?)
      @users = User.search_for_category(params[:category])
    elsif (!params[:skill].blank?)
      @users = User.search_for_skill(params[:skill])
    else
      @users=User.search(params[:search])
    end
  end

  def show
    @user=User.find(params[:id])
    @gigs=Gig.where(email: @user.email)
  end

  def destroy
    @user = User.find(params[:id])
    @gig = Gig.where(email: @user.email)
    
    @user.destroy
    @gig.destroy

    redirect_to workers_path, status: :see_other
  end
end
