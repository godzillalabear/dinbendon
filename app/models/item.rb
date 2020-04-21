class Item < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true, 
                    numericality: { greater_than: 0 }
  #relationships
  belongs_to :category 
  has_many :comments
  has_many :favorite_items
  has_many :users, through: :favorite_items
  
  has_one_attached :cover
  

  # scope :available, -> {where(deleted_at: nil)}
  default_scope {where deleted_at: nil}                


  def destroy
    @item.update(deleted_at: Time.now)
  end

  def favorited_by(u)
    u.items.include?(self)
  end

end
