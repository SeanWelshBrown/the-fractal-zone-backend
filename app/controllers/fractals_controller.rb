class FractalsController < ApplicationController
  before_action :authorized, only: [:create]

  def create 
    @fractal = @user.fractals.create(fractal_params)
    render json: @fractal
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
