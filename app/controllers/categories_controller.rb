class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def edit
    @category =  Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path(@category), notice: "Your category has been created"
    else
      render :new
    end
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    redirect_to categories_path notice: "Your category has been updated"
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path notice: "Your category has been deleted"
  end

  private
    def category_params
      params.require(:category).permit(:name, :description, :photo, :active)
    end

    def set_category
      @category = Category.find(params[:id])
    end
end
