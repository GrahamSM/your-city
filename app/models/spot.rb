class Spot < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :vibes
  belongs_to :category
  belongs_to :city
  validates :title, presence: true, length: {minimum: 2}
  validates :description, presence: true, length: {minimum: 5}
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :category_id, presence: true
  validates :image, presence: true
  validate :spot_must_be_in_city

  def spot_must_be_in_city
    if latitude && longitude
      if (latitude.to_f.abs - City.find(city_id).latitude.to_f.abs).abs > 1 || (longitude.to_f.abs - City.find(city_id).longitude.to_i.abs).abs > 1
          errors.add(:spot, "must be in the current city!")
      end
    end
  end
end
