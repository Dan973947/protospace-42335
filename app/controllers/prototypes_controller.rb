class PrototypesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def index
    @prototypes = Prototype.all
    @user = current_user
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
    @user = current_user
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
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

  def authorize_user!
    unless @prototype.user == current_user
      redirect_to root_path, alert: "不正なアクセスです!"
    end
  end

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image)
  end
end
