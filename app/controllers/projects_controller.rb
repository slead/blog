class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @projects = Project.all.order('created_at DESC')
  end

  def new
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      flash[:notice] = "project #{@project.title} added successfully."
      redirect_to @project
    else
      errors = []
      @project.errors.full_messages.each do |msg|
        errors << msg
      end
      flash.now[:error] = errors
      render 'new'
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to @project
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @project.destroy
    flash[:notice] = "project #{@project.title} deleted successfully."
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :image, :url)
  end

  def find_project
    @project = Project.friendly.find(params[:id])
  end
end
