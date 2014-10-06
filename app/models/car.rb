class Car < ActiveRecord::Base
  validates :color, presence: true
  validates :year, presence: true, inclusion: { in: 1920..2014 }
  validates :mileage, presence: true
  validates :manufacturer_id, presence: true

  belongs_to :manufacturer
end
