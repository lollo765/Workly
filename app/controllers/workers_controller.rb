class WorkersController < ApplicationController
  def index
    if (params[:search].blank? && params[:category].blank?)
      @users=User.all
    elsif (!params[:category].blank?)
      @users = User.search_for_category(params[:category])
    else 
      @users=User.search(params[:search])
    end
  end

  def show
    @user=User.find(params[:id])

    @gigs=Gig.all
  end

end
