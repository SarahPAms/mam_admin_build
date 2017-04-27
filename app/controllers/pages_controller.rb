class PagesController < ApplicationController
  before_action :set_category, only: [:show]
  def home
    @categories = Category.all.where(active: true)
    @testimonials = Testimonial.all.where(active: true)
  end

  def bios
    @abouts=About.all.where(active: true)
  end


    def show
      @contents = @category.contents
      if params[:search]
        @contents = Content.search(params[:search]).order("created_at DESC")
      else
        @contents = @category.contents.order("created_at DESC").take(5)
      end
    end

    private
      def set_category
        @category = Category.find(params[:id])
      end


end


# from CategoriesController
# def index
#   @categories = Category.all
# end
#
# def show
#   @contents = @category.contents
#   if params[:search]
#     @contents = Content.search(params[:search]).order("created_at DESC")
#   else
#     @contents = @category.contents.order("created_at DESC").take(5)
#   end
# end
