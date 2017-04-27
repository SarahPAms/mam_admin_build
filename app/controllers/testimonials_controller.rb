class TestimonialsController < ApplicationController
  def index
    @testimonials = Testimonial.all
  end

  def show
    @testimonial =  Testimonial.find(params[:id])
  end

  def new
    @testimonial = Testimonial.new
  end

  def edit
    @testimonial =  Testimonial.find(params[:id])
  end

  def create
    @testimonial = Testimonial.new(testimonial_params)
    if @testimonial.save
      redirect_to @testimonial, notice: "Your testimonial has been created"
    else
      render :new
    end
  end

  def update
    @testimonial = Testimonial.find(params[:id])
    @testimonial.update(testimonial_params)
    redirect_to testimonials_path notice: "Your testimonial has been updated"
  end

  def destroy
    @testimonial = Testimonial.find(params[:id])
    @testimonial.destroy
    redirect_to testimonials_path notice: "Your testimonial has been deleted"

  end


   private
     def testimonial_params
       params.require(:testimonial).permit(:id, :quote, :photo, :active, :first_name,
       :last_name, :title)
     end

     def set_category
       @category = Category.find(params[:id])
     end

     def image_params
       params[:photo].present? ? params.require(:photo) : []
     end
end
