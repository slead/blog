class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  
  def index
  end

  def new
  end

  def create
  end

  def show
  end


end
