class LikesController < ApplicationController
    before_action :authenticate_user, only: [:update, :create, :destroy]

    def create
    end

    def destroy
    end
end
