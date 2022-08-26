class Profile < ApplicationRecord
  belongs_to :user

  # validates :city, presence: true
  # validates :state, presence: true
  # validates :country, presence: true
  # validates :address_1, presence: true

  geocoded_by :address
  after_validation :geocode, if: -> { address.present? &&  latitude.blank? && longitude.blank? }

  def address
    [address_1, address_2, city, state, zip_code, country].compact.join(', ')

  end
end
