class ResevationsController < ApplicationController
  
 before_action :authenticate_user!
 
  def index
    @resevations = Resevation.all
    @user = current_user
  end
  
  
  def confirm
    @resevation = Resevation.new(resevation_params)
    @room  = Room.find(@resevation.room_id)
    @user = current_user
    @resevation.total_date = (@resevation.end_date - @resevation.start_date).to_i
    @resevation.total_price =  @resevation.room.price * @resevation.number_people * @resevation.total_date
    if @resevation.invalid?
      render template: "rooms/show"
    end
  end
  
  def create
    @resevation = Resevation.new(resevation_params)
    @room  = Room.find(@resevation.room_id)
    @user = current_user
    if  @resevation.save 
      redirect_to resevation_path(@resevation)
    end
  end
  
  def show
    @resevation = Resevation.find(params[:id])
    @room  = Room.find(@resevation.room_id)
    @user = current_user
  end
  
  
  private
  
  def resevation_params
    params.require(:resevation).permit(:start_date,:end_date,:number_people,:total_price,:total_date,:room_id,:user_id)
  end

end
