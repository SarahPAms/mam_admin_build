class PagesController < ApplicationController
  def home
    @categories = Category.all.where(active: true)
    @testimonials = Testimonial.all.where(active: true)
  end

  def bios
    @abouts=About.all.where(active: true)
  end
end
