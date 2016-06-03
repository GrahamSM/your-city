class Spotsuser < ActiveRecord::Base
  validates :user_id, uniqueness: {scope: :spot_id}
end
