class User < ApplicationRecord
    validates_presence_of :longitude
    validates_presence_of :latitude
    validates :phone_number, length: { in: 10..11 }
  end