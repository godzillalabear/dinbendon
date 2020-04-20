class Item < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true, 
                    numericality: { greater_than: 0 }
  #relationships
  belongs_to :category 
  has_many :comments
  
  has_one_attached :cover
  

  # scope :available, -> {where(deleted_at: nil)}
  default_scope {where deleted_at: nil}                
end

def destroy
   
    @item.update(deleted_at: Time.now)

  end