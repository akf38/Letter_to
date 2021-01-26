class Letter < ApplicationRecord
  belongs_to :dead
  attachment :limage
  
  validates :name, presence: true, length: {maximum: 50}
  validates :caption, presence: true
end
