module V2
  class MeController < ApplicationController
    def show
      render Requests::Me.show(current_user)
    end
  end
end
