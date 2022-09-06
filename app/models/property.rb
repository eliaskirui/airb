class Property < ApplicationRecord
  validates :name, presence: true
  validates :headline, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :country, presence: true
  validates :address_1, presence: true

  monetize :price_cents, allow_nil: true
  has_many_attached :images, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: -> { latitude.blank? && longitude.blank? }
  # after_validation :geocode, unless: ->(obj){ obj.latitude.present? and obj.present }

  def address
    # [state, "AU"].compact.join(',')
    [state, country].compact.join(', ')

    # return "19 Peachey Rd, Davoren Park SA 5113, Australia"
    # [address_1, address_2, city, state, country].compact.join(',')
    # [state, country].compact.join(', ')

  end

  def default_image
    images.first
  end

end
