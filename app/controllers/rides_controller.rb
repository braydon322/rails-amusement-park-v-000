class RidesController < ApplicationController
  def new
  end

  def create
    @ride = Ride.create(:user_id => params[:user_id], :attraction_id => params[:attraction_id])
    @user = User.find(params[:user_id])
    @attraction = Attraction.find(params[:attraction_id])

    if @user.height >= @attraction.min_height && @user.tickets >= @attraction.tickets
      @user.rides << @ride
      @user.happiness = @user.happiness.to_i + @attraction.happiness_rating.to_i
      @user.nausea = @user.nausea.to_i + @attraction.nausea_rating.to_i
      @user.tickets = @user.tickets.to_i - @attraction.tickets.to_i
      @user.save
      flash[:notice] = "Thanks for riding the #{@attraction.name}!"
      redirect_to user_path(@user)
    else
      if @user.height < @attraction.min_height && @user.tickets < @attraction.tickets
        flash[:notice] = "You do not have enough tickets to ride the #{@attraction.name}!
        <br>You are not tall enough to ride the #{@attraction.name}!"
        redirect_to user_path(@user)
      elsif @user.tickets < @attraction.tickets
        flash[:notice] = "You do not have enough tickets to ride the #{@attraction.name}!"
        redirect_to user_path(@user)
      elsif @user.height < @attraction.min_height
        flash[:notice] = "You are not tall enough to ride the #{@attraction.name}!"
        redirect_to user_path(@user)
      end
    end
  end
end
