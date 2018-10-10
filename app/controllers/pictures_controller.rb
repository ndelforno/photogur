class PicturesController < ApplicationController
before_action :ensure_logged_in, except: [:show, :index]
before_action :load_picture, only: [:show, :edit, :update, :destroy]
before_action :ensure_user_owns_picture, only: [:edit, :update, :destroy]

  def load_picture
    @picture = Picture.find(params[:id])
  end

  def ensure_user_owns_picture
    unless current_user == @picture.user
      flash[:alert] = "Please log in"
      redirect_to new_session_url
    end
  end

  def index
    @pictures = Picture.all
    @most_recent_pictures = Picture.most_recent_five
    @one_month_old_pic = Picture.created_before
    @years = Picture.pluck(:created_at).map{|x| x.year}.uniq
  end

  def show
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new

    @picture.title = params[:picture][:title]
    @picture.artist = params[:picture][:artist]
    @picture.url = params[:picture][:url]
    @picture.user = current_user

    if @picture.save
      # if the picture gets saved, generate a get request to "/pictures" (the index)
      redirect_to "/pictures"
    else
      render :new
    end
  end


  def edit
  end

  def update

    @picture.title = params[:picture][:title]
    @picture.artist = params[:picture][:artist]
    @picture.url = params[:picture][:url]
    @picture.created_at = params[:picture][:created_at]

    if @picture.save
      redirect_to "/pictures/#{@picture.id}"
    else
      render :edit
    end
  end

  def destroy
    @picture.destroy
    redirect_to "/pictures"
  end

end
