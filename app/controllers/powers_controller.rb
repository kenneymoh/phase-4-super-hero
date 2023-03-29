class PowersController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  #GET/powers
  def index
      render json: Power.all
  end

  #GET/powers/:id
  def show
      power = Power.find(params[:id])
          render json: power, status: :ok
  end
  #PATCH/power/:id
  def update
      power = Power.find(params[:id])
      if power
          power.update(power_params)
          render json: power
      else
          render json: { errors: "validation errors"}, status: :unprocessable_entity
      end
  end

      private
  def render_not_found_response
      render json: { error: "Power not found"}, status: :not_found
  end

  def power_params
      params.permit(:description)
  end
end
