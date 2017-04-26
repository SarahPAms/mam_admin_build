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

  def create
    @content = Content.new(content_params)
          debugger
    if @content.save

      image_params.each do | image |
        @content.photo.create(image: image)
      end

      redirect_to @content, notice: "Your content has been created"
    else
      render :new
    end
  end

  def update
    @content = Content.find(params[:id])
    @content.update(content_params)
    redirect_to content_path notice: "Your content has been updated"
  end

  def destroy
    @content = Content.find(params[:id])
    @content.destroy
    redirect_to content_path notice: "Your content has been deleted"
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
       params[:images].present? ? params.require(:images) : []
     end
end
