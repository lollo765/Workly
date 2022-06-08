class GigsController < ApplicationController

  def index
    if (params[:search].blank? && params[:categories].blank? && params[:skill].blank?)
      @gigs = Gig.all
    elsif (!params[:categories].blank?)
      @gigs = Gig.search(params[:categories])
    elsif (!params[:skill].blank?)
      @gigs = Gig.search_for_skills(params[:skill])
    else
      @gigs = Gig.search(params[:search])
   end
  end

  def show
    @gig = Gig.find(params[:id])
  end

  def new
    @gig = Gig.new
  end

  def create
    @gig = Gig.new(gig_params)
    if current_user
      @gig.email = current_user.email
    end 
    if @gig.save
      redirect_to @gig
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @gig = Gig.find(params[:id])
  end

  def update
    @gig = Gig.find(params[:id])

    if @gig.update(gig_params)
      redirect_to @gig
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @gig = Gig.find(params[:id])
    authorize! :create, @gig, :message => "BEWARE: you are not authorized to destroy this gig."
    @gig.destroy

    redirect_to root_path, status: :see_other
  end

  private
  def gig_params
    params.require(:gig).permit(:title, :categories, :skill, :currency, :cost, :description )
  end

end
