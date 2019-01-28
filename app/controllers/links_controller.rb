class LinksController < ApplicationController
  before_action :user_is_block?,  only: [:create, :update, :edit, :destroy]

  def index
    @links = Link.all
  end

  def show
    @link = Link.find(params[:id])
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.user_id = current_user.id
    @link.save
    redirect_to @link
  end

  def update
    @link = Link.find(params[:id])
    @link.update!(link_params)
  end

  def edit

  end

  def destroy
    @link = Link.find(params[:id]).destroy
    redirect_to :action => 'index', :controller => 'links'
  end

  private

  def link_params
    params.require(:link).permit(:link, :title, :id, :user_id)
  end
end
