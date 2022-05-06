class GigsController < ApplicationController
  def index
    @gigs = Gig.all 
  end

  def show
    @gig = Gig.find(params[:id])
  end

  def new
    @gig = Gig.new
  end

  def create
    @gig = Gig.new(gig_params)
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
    @gig.destroy

    redirect_to root_path, status: :see_other
  end

  private
  def gig_params
    params.require(:gig).permit(:title, :categories, :skill, :currency)
  end

end
