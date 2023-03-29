class HeroPowersController < ApplicationController

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_respnse

  #POST/hero_powers
  def create
      hero_power = HeroPower.create!(hero_power_params)
      if hero_power.valid?
          render json: hero_power, status: :created
      else
          render json: { errors: "validation errors"}, status: :uprocessable_entity
      end

  end

  private
  def hero_power_params
      params.permit(:strength, :power_id, :hero_id)
  end

  def render_unprocessable_entity_respnse(invalid)
      render json: { errors: "validation errors"}, status: :unprocessable_entity
  end
end
