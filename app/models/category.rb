class Category < ApplicationRecord
  has_many :contents

  mount_uploader :photo, ImageUploader

  validates_presence_of :name
  validates_presence_of :description
  default_scope { where(active: true)}
end
