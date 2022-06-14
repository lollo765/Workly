class LavorosController < ApplicationController
  def index
    if (params[:search].blank? && params[:categories].blank? && params[:skill_Lavoratori].blank?)
      @lavoros = Lavoro.all
    elsif (params[:search].blank? && !params[:categories].blank? && params[:skill_Lavoratori].blank?)
      @lavoros = Lavoro.search(params[:categories])
    elsif(params[:search].blank? && params[:categories].blank? && !params[:skill_Lavoratori].blank?)
      @lavoros = Lavoro.search(params[:skill_Lavoratori])
    else
      @lavoros = Lavoro.search(params[:search])
   end
  end

  def show
    if( params[:candidate])
      Lavoro.find(params[:id]).add_to_set( candidates: current_user.email )
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
    #authorize! :create, @lavoro, :message => "Attenzione:Non sei autorizzato ad eliminare questo file"
    @lavoro.destroy
    redirect_to lavoros_path, status: :see_other
  end

  private
   def set_lavoro
    @lavoro = Lavoro.find(params[:id])
   end
   def lavoro_params
    params.require(:lavoro).permit(:title,:description,:n_Lavoratori,:categories,:skill_Lavoratori,:timer,:currency)
   end
end
