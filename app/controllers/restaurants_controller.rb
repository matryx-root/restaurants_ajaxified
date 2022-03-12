class RestaurantsController < ApplicationController
  before_action :set_movie, only: %w[show edit update destroy]
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
   end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path
  end


  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :address)
  end

  def set_movie
  @restaurant = Restaurant.find(params[:id])
  end

end
