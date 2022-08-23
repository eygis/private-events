class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @events = User.find(params[:id]).events
        @attended_events = User.find(params[:id]).attended_events
    end
end