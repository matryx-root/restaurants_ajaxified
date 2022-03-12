class ReviewsController < ApplicationController
  protect_from_forgery con: :null_session
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant, anchor: "review-#{@review.id}")
    else
      render "restaurants/show"
    end
  end

   def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant)
  end



  private

  def review_params
    params.require(:review).permit(:content)
  end

end
