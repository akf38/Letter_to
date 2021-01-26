class Dead < ApplicationRecord
  belongs_to :user
  attachment :dimage
  
  has_many :letters, dependent: :destroy
  
  validates :name, presence: true, length: {maximum: 50}
end
