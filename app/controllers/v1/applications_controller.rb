require 'roar/representer/json/hal'
require 'roar/rails/hal'
module V1
  class ApplicationsController < ApiController
    include Roar::Rails::ControllerAdditions
    include Roar::Rails::ControllerAdditions::Render
    before_action :set_application, only: [:show, :update, :destroy]

    def index
      # render json: Application.all
      # render json: ApplicationRepresenter.new(Application.all)
      # render json: Application.all, represent_items_with: V1::ApplicationRepresenter
      render json: Application.all
    end

    def show
      respond_with json: @application
    end

    def create
      application = Application.create!(application_params)
      render json: { id: application.id.to_s }, status: :created
    end

    def update
      @application.update!(application_params)
      render json: @application
    end

    def destroy
      @application.destroy
    end

    private

    def set_application
      @application = Application.find_by!(id: params[:id])
    end

    def application_params
      params.require(:application).permit(:name, :description)
    end
  end
end
