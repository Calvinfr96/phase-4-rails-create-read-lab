class PlantsController < ApplicationController
    def index
        plants = Plant.all
        render json: plants
    end

    def show
        id = params[:id]
        plant = Plant.find_by(id: id)
        if plant
            render json: plant
        else
            render json: {error: "Plant not found"}, status: :not_found
        end
    end

    def create
        plant = Plant.create(plant_params)
        render json: plant, status: :created
    end

    def destroy
        plant = Plant.find_by(id: params[:id])
        plant.destroy
    end
    
    private

    def plant_params
        params.permit(:name, :image, :price)
    end
end
