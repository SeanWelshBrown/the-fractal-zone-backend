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
    newFractals = @fractals.each do |fractal|
      fractal.parameters = fractal.parameters.gsub! '=>', ': '
    end
    render json: newFractals
  end

  def destroy 
    @fractal = Fractal.find_by(id: params[:id])
    @fractal.destroy
  end

  private
  def fractal_params
    params.permit(
      :name, 
      :image, 
      :parameters [
        :theta,
        :length,
        :rules => [
          :axiom,
          :setA,
          :setB
        ]
      ]
    )
  end

end
