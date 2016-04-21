class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new
    @image.image = params[:image]

    if @image.save
      redirect_to "/images", :notice => "Image created successfully."
    else
      render 'new'
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])

    @image.image = params[:image]

    if @image.save
      redirect_to "/images", :notice => "Image updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @image = Image.find(params[:id])

    @image.destroy

    redirect_to "/images", :notice => "Image deleted."
  end
end
