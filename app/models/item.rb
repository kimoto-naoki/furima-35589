class Item < ApplicationRecord
  validates :item_name, :item_text, :category_id, :condition_id, :who_cost_id, 
            :shipping_area_id, :days_to_ship_id, :price,:image,       presence: true

  with_options numericality: { other_than: 1 } do 
    validates :category_id 
    validates :condition_id
    validates :who_cost_id
    validates :shipping_area_id
    validates :days_to_ship_id
  end
  
  validates :price, inclusion: { in: 300..9999999 }
  validates :price, format: { with: /\A[0-9]+\z/ }
  validates :price, numericality: { only_integer: true }
  

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :who_cost
  belongs_to :shipping_area
  belongs_to :days_to_ship
end
