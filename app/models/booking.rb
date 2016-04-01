class Booking < ActiveRecord::Base

  validates_presence_of :name, :pax, :destiny, :pickup

  validates :email,
            presence: { message: "Enter your email address" },
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "Enter a valid email address" }

  validates :phone,
  			numericality: { only_integer: true }, allow_blank: true

end