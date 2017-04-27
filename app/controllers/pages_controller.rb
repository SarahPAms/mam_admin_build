class PagesController < ApplicationController
  def home
    @categories = Category.all
    @testimonials = Testimonial.all
  end

  def bios
    @abouts=About.all
  end
end
