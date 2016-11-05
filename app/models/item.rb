class Item < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image, presence: true

  belongs_to :category

  has_many :orders_items
  has_many :orders, through: :orders_items
end
