class GymsController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :render_gym_not_found

    def index
        render json: Gym.all
    end

    def show
        gym = find_gym
        render json: gym, status: :ok
    end

    def update
        gym = find_gym.update(gym_params)
        render json: find_gym, status: :ok
    end

    def destroy
        find_gym.destroy
        render json: {}, status: :ok
    end

    private

    def find_gym
        Gym.find(params[:id])
    end

    def gym_params
        params.require(:gym).permit(:name, :address)
    end

    def render_gym_not_found
        render json: {error: "Gym not found"}, status: :not_found
    end

end
