class Spot < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :vibes
  belongs_to :category
  belongs_to :city
  validates :title, presence: true, length: {minimum: 2}
  validates :location, presence: true, length: {minimum: 2}
  validates :description, presence: true, length: {minimum: 10}
  validates :latitude, presence: true, length: {minimum: 5}
  validates :longitude, presence: true, length: {minimum: 5}
  validates :category_id, presence: true, length: {minimum: 1}
end
