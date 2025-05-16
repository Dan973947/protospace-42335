class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    @prototype.user = current_user
    if @prototype.save
      redirect_to @prototype
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to @prototype
    else
      render :edit
    end
  end

  def destroy
    @prototype.destroy
    redirect_to prototypes_path, notice: "削除しました"
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image)
  end
end
