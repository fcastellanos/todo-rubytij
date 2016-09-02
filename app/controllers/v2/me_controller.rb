module V2
  class MeController < ApplicationController
    def show
      render Requests::Me.show(current_user)
    end

    def update
      render Requests::Me.update(current_user, user_params)
    end

    private

    def user_params
      params.permit(:first_name, :last_name, :city, :gender)
    end
  end
end
