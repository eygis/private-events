class RegistrationsController < ApplicationController

    before_action :require_login
    
    def create

        @event_id = params[:event_id] 

        @registration = Registration.new(user_id: current_user[:id], event_id: @event_id)

        if @registration.save
            flash[:notice] = 'Successfully Registered!'
            redirect_to root_path
        else
            @registration.errors.any? ? flash[:error] = @registration.errors.full_messages[0].slice(5..) : flash[:error] = 'Registration Error.'
            redirect_to events_path
        end
    end

    private

    def require_login
        unless user_signed_in?
          flash[:error] = 'You must be logged in to do that.'
          redirect_to events_path
        end
    end

end
