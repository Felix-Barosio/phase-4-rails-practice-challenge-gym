class MembershipsController < ApplicationController

    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessed_entity_exception

    def index
        render json: Membership.all
    end

    def create
        member = Membership.create!(memberships_params)
        render json: member, status: :created
    end

    private

    def memberships_params
        params.require(:membership).permit(:gym_id, :client_id, :charge)
    end

    def render_unprocessed_entity_exception(invalid)
        render json: {error: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

end
