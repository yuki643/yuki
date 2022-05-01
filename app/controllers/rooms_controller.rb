class RoomsController < ApplicationController
  
  def search
    @rooms = Room.search(params[:search],params[:keyword])
    @user = current_user
  end
  
  def index
    @rooms = Room.all
    @user = current_user
  end
  
  def new
    @room = Room.new
    @user = current_user
  end
 
  def create
    @user = current_user
    @room = Room.new(room_params)
    if @room.save
      redirect_to room_path(@room)
    else
      render "new"
    end
  end
 
  def show
    @user = current_user
    @room = Room.find(params[:id])
    @resevation = Resevation.new
  end
  
  private
  
  def room_params
    params.require(:room).permit(:room_name,:room_introduction,:price,:address,:room_image).merge(user_id: current_user.id)
  end
  
end
