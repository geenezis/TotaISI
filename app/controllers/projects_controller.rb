class ProjectsController < ApplicationController
  def index
  	@managed_projects = current_user.projects.where(:project_associations => {:association_type_vo => "manager"})
  	@contributions = current_user.projects.where(:project_associations => {:association_type_vo => "contributor"})
  end

  def show
  	@project = Project.find(params[:id])
  end

  def new
    respond_to do |format|
      format.html
      format.js
    end
    @project = Project.new
  end

  def create
    #@project = Project.new(project_params)
    p = Project.create(project_params)
    ProjectAssociation.create(user: current_user, project: p, association_type_vo: 'manager')

    redirect_to :back
  end

  private
    def project_params
      params.require(:project).permit(:name)
    end
end
