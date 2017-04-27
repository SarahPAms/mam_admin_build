class Testimonial < ApplicationRecord
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :quote
  # validates_presence_of :photo



  def full_name
    "#{first_name} #{last_name}"
  end
end
