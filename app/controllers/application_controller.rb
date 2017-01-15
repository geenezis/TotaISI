class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :find_invitations

  private 
    def find_invitations
      @invitations = Invitation.where(user_id: current_user)
    end
end
