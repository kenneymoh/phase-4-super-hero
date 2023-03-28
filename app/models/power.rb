class Power < ApplicationRecord
  has_many :hero_power
  has_many :power, through: :hero_power

  validates :description, length: { minimum: 20 }

end
