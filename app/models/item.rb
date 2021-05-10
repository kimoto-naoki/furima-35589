class Item < ApplicationRecord
  vailidates :item_name, :item_text, :category_id, :condition_id, :who_cost_id, 
            :shipping_area_id, :days_to_ship_id, :price, :user ,:image,       presence: true

  validates :price, inclusion: { in: 300..9999999 }
  validates :price, fomat: { with: /\A[0-9]+\z/ }
end
