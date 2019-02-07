class LinksController < ApplicationController
  before_action :user_is_block?,  only: [:create, :update, :edit, :destroy]
  before_action :def_link, only: [:show, :edit, :update, :destroy]

  def index
    @links = Link.all
    respond_to do |format|
      format.html
      format.json { render :json => @links }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render :json => @link }
    end
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.user_id = current_user.id
    if @link.save
      redirect_to @link
    else
      render 'new'
    end
  end

  def update
    if @link.update(link_params)
      redirect_to @link
    else
      render 'new'
    end
  end

  def edit; end

  def destroy
    @link.destroy
    redirect_to :action => 'index', :controller => 'links'
  end

  private

  def def_link
    @link = Link.find(params[:id])
  end

  def link_params
    params.require(:link).permit(:link, :title, :id, :user_id)
  end
end
