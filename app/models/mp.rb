class Mp < ApplicationRecord
  extend FriendlyId
  friendly_id :constituency, use: :slugged

  has_many :articles

end
