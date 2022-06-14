class UsersController < ApplicationController

    def show
        @user = current_user
        @attended_events = current_user.attended_event_ids
    end
end
