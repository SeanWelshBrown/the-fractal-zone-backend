class FractalsController < ApplicationController
  before_action :authorized, only: [:create, :destroy]

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

  def destroy 
    @fractal = Fractal.find_by(id: params[:id])
    @fractal.destroy
  end

  private
  def fractal_params
    params.permit(:name, :image, :rule, :fractal_type)
  end

end
