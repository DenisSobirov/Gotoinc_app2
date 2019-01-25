class LinksController < ApplicationController
  before_action :user_is_block?, :only => [ :show, :index, :edit, :update, :destoy ]

  def index
    @links = Link.all
  end

  def show
    @link = Link.find(params[:id])
  end

  def new
    @link = Link.new(link_params)
  end

  def create
    @link = Link.new
    @link = Link.save!(link_params)
  end

  def update
    @link = Link.find(params[:id])
    @link.update!(link_params)
  end

  def destroy
  end

  private

  def link_params
    params.require(:person).permit(:id, :link, :title)
  end
end
