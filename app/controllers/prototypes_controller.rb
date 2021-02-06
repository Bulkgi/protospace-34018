class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :updata]
  before_action :authenticate, only: :edit
  
  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototypes = Prototype.new(prototype_params)
    if @prototypes.save
      redirect_to root_path      
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments
  end

  def edit
  end

  def update
    if @prototype.update(prototype_params)  
      redirect_to prototype_path (@prototype)     
    else
      render :edit
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path 
  end
  

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def set_post
    @prototype = Prototype.find(params[:id])
  end

  def authenticate
    unless user_signed_in? && current_user.id == @prototype.user_id
      redirect_to root_path
    end
  end

end
