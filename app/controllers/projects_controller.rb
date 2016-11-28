class ProjectsController < ApplicationController
  def index
  	@managed_projects = current_user.projects.where(:project_associations => {:association_type_vo => "manager"})
  	@contributions = current_user.projects.where(:project_associations => {:association_type_vo => "contributor"})
  end

  def show
  	@project = Project.find(params[:id])
  end
end
