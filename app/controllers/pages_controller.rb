class PagesController < ApplicationController
  def home
    @categories = Category.all
    @testimonials = Testimonial.all
  end

  def about
    @abouts=About.all
  end
end
