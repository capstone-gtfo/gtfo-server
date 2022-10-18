class User < ApplicationRecord
    validates_presence_of :long
    validates_presence_of :lat
    validates :phone, length: { in: 10..11 }
  end
