class Content < ApplicationRecord
  belongs_to :category

  validates_presence_of :info_label
  
  def self.search(search)
    where("info_label ILIKE ? OR info_text ILIKE ?", "%#{search}%", "%#{search}%")
  end
end
