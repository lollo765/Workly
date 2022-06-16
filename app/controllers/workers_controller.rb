class WorkersController < ApplicationController
  def index
    if (params[:search].blank? && params[:category].blank? && params[:skill].blank? && params[:review].blank?)
      @users=User.all
    elsif (!params[:category].blank?)
      @users = User.where(category: params[:category])
    elsif (!params[:skill].blank?)
      skill = params[:skill].split(",")
      l = skill.length
      x = User.search_for_skills(skill[0])
      for i in 1...l
        x=x.and(User.search_for_skills(skill[i]))
      end
      @users=x
      #@users = User.search_for_skills(skill[0]).and(User.search_for_skills("Shopify-Developer"))
      #@users = User.where(skill: params[:skill])
    elsif (!params[:review].blank?)
      @users = User.where(review: params[:review])
    else
      @users=User.search(params[:search])
    end
  end

  def show
    @user=User.find(params[:id])
    @gigs=Gig.where(email: @user.email)
    @lavoros=Lavoro.where(email: @user.email)
  end

  def destroy
    @user = User.find(params[:id])
    @gigs = Gig.where(email: @user.email)
    @lavoros=Lavoro.where(email: @user.email)

    
    @user.destroy
    @gigs.destroy
    @lavoros.destroy

    redirect_to workers_path, status: :see_other
  end
end
