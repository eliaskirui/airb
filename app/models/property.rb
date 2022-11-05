# frozen_string_literal: true
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
  has_many :reviews, as: :reviewable
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  has_many :reservations, dependent: :destroy
  has_many :reserved_users, through: :reservations, source: :user

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

  # def average_rating
  #   reviews.average(:rating)
  # end
  def available_dates
    next_reservation = reservations.future_reservations.first
    # next_reservation = reservations.where("reservation_date >  ?", Date.today).order(:reservation_date).first
    date_format = "%b %e"
    return Date.tomorrow.strftime(date_format)..Date.today.end_of_year.strftime(date_format) if next_reservation == nil

    Date.tomorrow.strftime(date_format)..next_reservation.reservation_date.strftime(date_format)
  end

end
