class AttractionsController < ApplicationController
  def new
    @attraction = Attraction.new
  end

 def edit
   @attraction = Attraction.find(params[:id])
 end

 def create
  @attraction = Attraction.new(attraction_params)
    if @attraction.save
      flash[:notice] = "Attraction was successfully created."
      redirect_to @attraction
    else
      format.html { render :new }
    end
end

 def update
   @attraction = Attraction.find(params[:id])
   @attraction.update(attraction_params)
   redirect_to @attraction
 end

  def index
    current_user
    @attractions = Attraction.all
  end

  def show
    current_user
    @attraction = Attraction.find(params[:id])
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
  end

  def current_user
    @user = User.find(session[:user_id])
  end
end
