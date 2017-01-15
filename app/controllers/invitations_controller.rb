class InvitationsController < ApplicationController
  def destroy
    @invitation = Invitation.find(params[:id])
    @invitation.destroy
    redirect_to :back
  end

  def new
    @invitation = Invitation.new
    @project = Project.find(params[:project_id])
  end

  def create
    @project = Project.find(params[:project_id])
    user = User.find_by_email(params[:user])
    if user.nil? || user.id == current_user.id
      redirect_to @project
    else
      @invitation = Invitation.new(user_id: user.id, project_id: params[:project_id])
      @invitation.save
      redirect_to @project
    end
  end

  def accept
    invitation = Invitation.find(params[:id])
    ProjectAssociation.create(user: current_user, project: invitation.project, association_type_vo: 'contributor')
    invitation.destroy
    redirect_to invitation.project
  end

  def index
  end
end
