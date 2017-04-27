class ContentsController < ApplicationController
  # before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @contents = Content.all
  end

  def show
    @content =  Content.find(params[:id])
  end

  def new
    @content = Content.new
  end

  def edit
    @content =  Content.find(params[:id])
  end

  def create
    @content = Content.new(content_params)
    if @content.save
      image_params do |image|
        @content.photo.create(photo: photo)
      end
      redirect_to @content, notice: "Your content has been created"
    else
      render :new
    end
  end

  def update
    @content = Content.find(params[:id])
    @content.update(content_params)
    redirect_to contents_path notice: "Your content has been updated"
  end

  def destroy
    @content = Content.find(params[:id])
    @content.destroy
    redirect_to contents_path notice: "Your content has been deleted"

  end


   private
     def content_params
       params.require(:content).permit(:id, :info_label, :info_text, :video, :photo,
       :active, :website_link, :category_id)
     end

     def set_category
       @category = Category.find(params[:id])
     end

     def image_params
       params[:photo].present? ? params.require(:photo) : []
     end
end
