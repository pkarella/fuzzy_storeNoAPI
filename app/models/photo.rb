class Photo < ApplicationRecord
  belongs_to :photoable, :polymorphic => true

  has_attached_file :image, :styles => { :large => "400x400>", :medium => "200x200>", :thumb => "100x100#" }, :default_url => ":style/owls.jpeg"

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
