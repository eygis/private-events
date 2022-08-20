class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @events = User.find(params[:id]).events
    end
end