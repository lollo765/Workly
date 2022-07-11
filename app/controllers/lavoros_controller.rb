class LavorosController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    if (params[:search].blank? && params[:categories].blank? && params[:skill_Lavoratori].blank?)
      @lavoros = Lavoro.all
    elsif (!params[:categories].blank?)
      @lavoros = Lavoro.search(params[:categories])
    elsif(!params[:skill_Lavoratori].blank?)
      skill_Lavoratori = params[:skill_Lavoratori].split("; ")
      l = skill_Lavoratori.length
      x = Lavoro.search_for_skills(skill_Lavoratori[0])
      for i in 1...l
        x=x.and(Lavoro.search_for_skills(skill_Lavoratori[i]))
      end
      @lavoros=x
    else
      @lavoros = Lavoro.search(params[:search])
   end
  end

  def show
    if( params[:candidate])
      Lavoro.find(params[:id]).add_to_set( candidates: current_user.email )
    elsif( params[:candidate_remove])
      Lavoro.find(params[:id]).pull( candidates: current_user.email )
    end
    @lavoro=Lavoro.find(params[:id])
  end

  def new
    @lavoro = Lavoro.new
  end

  def create 
    @lavoro = current_user.lavoros.new(lavoro_params)
    if current_user
      @lavoro.email = current_user.email
    end 
    if @lavoro.save
      redirect_to lavoros_path, :message => "Lavoro creato correttamente"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @lavoro = Lavoro.find(params[:id])
  end

  def update
    @lavoro = Lavoro.find(params[:id])
    if (current_user && (@lavoro.user == current_user || current_user.admin == true))
      if @lavoro.update(lavoro_params)
        redirect_to @lavoro
      else
      render :edit,status: :unprocessable_entity
     end
    else
      redirect_to lavoros_path
    end
  end

  def destroy
    @lavoro = Lavoro.find(params[:id])
    @lavoro.destroy
    redirect_to lavoros_path, status: :see_other
  end

  private
   def set_lavoro
    @lavoro = Lavoro.find(params[:id])
   end
   def lavoro_params
    params.require(:lavoro).permit(:title,:description,:n_Lavoratori,:categories,:skill_Lavoratori,:timer,:cost,:currency)
   end
end
