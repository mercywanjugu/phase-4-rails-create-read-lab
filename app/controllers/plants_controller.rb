class PlantsController < ApplicationController
    # wrap_parameters format: []

    def index
        plants = Plant.all
        render json: plants
    end

    def show
        plant = Plant.find(params[:id])
        if plant
            render json: plant
        else
            render json: {error: "plant not found"}, status: :not_found
        end
    end

    def create
        new_plant = Plant.create(plant_params)
        render json: new_plant, status: :created
    end
    

    private

    def plant_params
        params.permit(:name, :image, :price)
    end

end