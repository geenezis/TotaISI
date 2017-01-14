class ProjectsController < ApplicationController
  def index
  	@managed_projects = current_user.projects.where(:project_associations => {:association_type_vo => "manager"})
  	@contributions = current_user.projects.where(:project_associations => {:association_type_vo => "contributor"})
  end

  def show
  	@project = Project.find(params[:id])
    @to_do = @project.tasks.where(status: "To Do")
    @in_progress = @project.tasks.where(status: "In Progress")
    @done = @project.tasks.where(status: "Done")
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
 
    if @project.save
      ProjectAssociation.create(user: current_user, project: Project.find(@project.id), association_type_vo: 'manager')
      redirect_to @project
    else
      render 'new'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project_associations = ProjectAssociation.where(project: @project)
    @project_associations.each { |p| p.destroy}
    @project.destroy
    redirect_to :back
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
   
    if @project.update(project_params)
      redirect_to projects_url
    else
      render 'edit'
    end
  end

  private
    def project_params
      params.require(:project).permit(:name)
    end
end
