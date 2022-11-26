class PlantsController < ApplicationController
    def index
        render json:Plant.all, except: [:created_at, :updated_at]
    end
    #GET plants/:id
    def show
        plant=Plant.find_by(id: params[:id])
        if plant
            render json:plant, except: [:created_at, :updated_at]
        else
            render json:{error:"Plant Not Found"}, status: :not_found
        end
    end
    # def create
    #     plant = Plant.create(name: params[:name, image: params[:image]], price: params[:price])
    #     render json:plant, status: :created
    # end
    def create
        plant=Plant.create(plant_params)
        render json:plant,except: [:created_at, :updated_at], status: :created
    end
    private
    def plant_params
        params.permit(:name, :image, :price)

    end
end
