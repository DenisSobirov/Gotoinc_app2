class LinksController < ApplicationController

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
    params.require(:link).permit(:link, :title, :id)
  end
end
