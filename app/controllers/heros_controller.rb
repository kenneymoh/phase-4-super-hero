class HerosController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
      #GET/heroes
      def index
          render json: Hero.all
      end

      #GET/heroes/:id
      def show
          hero = Hero.find_by(params[:id])
              render json: hero, include: :powers
      end

      private
      def render_not_found_response
          render json: { error: "Hero not found"}, status: :not_found
      end
  end
