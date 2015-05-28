class PresentationsController < ApplicationController
  before_action :find_presentation, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @presentations = Presentation.all
  end

  def new
    @presentation = current_user.presentations.build
  end

  def create
    @presentation = current_user.presentations.build(presentation_params)
    if @presentation.save
      flash[:notice] = "presentation #{@presentation.title} added successfully."
      redirect_to @presentation
    else
      errors = []
      @presentation.errors.full_messages.each do |msg|
        errors << msg
      end
      flash.now[:error] = errors
      render 'new'
    end
  end

  def edit
  end

  def update
    if @presentation.update(presentation_params)
      redirect_to @presentation
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @presentation.destroy
    flash[:notice] = "presentation #{@presentation.title} deleted successfully."
    redirect_to presentations_path
  end

  private

  def presentation_params
    params.require(:presentation).permit(:title, :description, :url)
  end

  def find_presentation
    @presentation = Presentation.friendly.find(params[:id])
  end
end
