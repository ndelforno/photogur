class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def show
    @pictures = Picture.find(params[:id])
  end
end
