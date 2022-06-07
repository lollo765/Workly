class UserPagesController < ApplicationController

  def index
    if (params[:search].blank?)
      @user=User.all
      @gig=Gig.all
    else 
      @user=User.search(params[:search])
    end
  end

=begin
  def index
    if (params[:search].blank?)
      @user= User.find_by(email: current_user.email)

      @gig=Gig.find_by(email: current_user.email)
      if(@gig)
        @gigskill=@gig.skill
      else @gigskill="";
      end
    else 
      @user=User.search(params[:search])

      
    end
  end
=end

  def show
    @user = User.find(id: current_user.id)
  end

  def editUser
    @user= User.find_by(email: current_user.email)
    render "user_pages/edit"
    #render "user_pages/edit", :locals => { :parameter => @user }
  end

  def updateUser
    @user= User.find_by(email: current_user.email)
    if @user.update(user_params)
      render "user_pages/index"
    else
      render :editUser, status: :unprocessable_entity
    end
  end

  def searchUser
    @user= User.find_by(name: params[:name])
    if @user
      @gig=Gig.find_by(email: @user.email)
      if(@gig)
        @gigskill=@gig.skill
      else @gigskill="";
      end
      render "user_pages/show_user"
    end
  end

  private
  def user_params
    params.permit(:name, :address, :skill, :category)
  end

end
