class Vibe < ActiveRecord::Base
  has_and_belongs_to_many :spots
end
