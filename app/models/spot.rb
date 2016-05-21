class Spot < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :vibes
  belongs_to :category
  belongs_to :city
  validates :title, presence: true
  validates :location, presence: true
  validates :description, presence: true
end
