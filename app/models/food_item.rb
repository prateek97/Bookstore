class FoodItem < ApplicationRecord
  has_many :orders, dependent: :destroy
  validates :name, :price, :section, presence: true

  def default_image_url
    image_url.present? ? image_url : "http://loremflickr.com/320/240/#{CGI.escape name}"
  end

  def self.by_section(section)
    where(section: section)
  end

  def increase_view
    self.view_counter += 1
    self.save
  end
end
