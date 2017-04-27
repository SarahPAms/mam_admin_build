class AboutsController < ApplicationController

  def index
    @abouts=About.all
  end

  def show
    @about =  About.find(params[:id])
  end

  def new
    @about = About.new
  end

  def edit
    @about =  About.find(params[:id])
  end

  def create
    @about = About.new(about_params)
    if @about.save
      redirect_to abouts_path(@about), notice: "Your about has been created"
    else
      render :new
    end
  end

  def update
    @about = About.find(params[:id])
    @about.update(about_params)
    redirect_to abouts_path notice: "Your about has been updated"
  end

  def destroy
    @about = About.find(params[:id])
    @about.destroy
    redirect_to abouts_path notice: "Your about has been deleted"
  end


   private
     def about_params
       params.require(:about).permit(:id, :name, :motto, :bio, :photo, :active)
     end

     def set_category
       @category = Category.find(params[:id])
     end

     def image_params
       params[:photo].present? ? params.require(:photo) : []
     end
end
