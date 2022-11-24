class ClientsController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_client_not_found

    def index
        render json: Client.all
    end

    def show
        client = find_client
        render json: client
    end

    def create
        client = Client.create!(client_params)
        render json: client, status: :created
    end

    def update
        client = find_client.update(client_params)
        render json: find_client, status: :ok
    end

    def destroy
        client = Client.find(params[:id])
        client.destroy!
        head :no_content, status: :ok
    end

    private

    def find_client
        Client.find(params[:id])
    end

    def client_params
        params.require(:client).permit(:name, :age)
    end

    def render_client_not_found
        render json: {error: "Client record not found"}, status: :not_found
    end

end
