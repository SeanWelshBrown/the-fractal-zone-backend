class FractalsController < ApplicationController
  before_action :authorized, only: [:create]

  def create 
    @fractal = @user.fractals.create(fractal_params)
    if @fractal.valid?
      render json: @fractal
    else
      render json: {error: "All forms must be filled"}
    end
  end

  def index
    @fractals = Fractal.all 
    render json: @fractals
  end

  private
  def fractal_params
    params.permit(:name, :image, :rule, :fractal_type)
  end

end
