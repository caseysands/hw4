class PlacesController < ApplicationController

  def index
     @places = Place.all
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    if @current_user
      @posts = Post.where({ "place_id" => @place["id"] ,"user_id" => @current_user["id"]})
    end
  end

  def new
    @place = Place.new
  end

  def create
    if @current_user
       @place = Place.new
       @place["name"] = params["place"]["name"]
       @place.save
    else
      flash["notice"] = "Please login to add new places."
    end
    redirect_to "/places"
  end

end
