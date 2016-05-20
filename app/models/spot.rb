class Spot < ActiveRecord::Base
  belongs_to :user
  has_many :vibes #:TODO validation limit <= 3
  belongs_to :category
  belongs_to :city
  validates :title, uniqueness: true, presence: true
  validates :location, presence: true
  validates :description, presence: true
end
