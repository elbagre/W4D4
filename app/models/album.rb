# == Schema Information
#
# Table name: albums
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  record_type :string           not null
#  band_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Album < ActiveRecord::Base

  validates(
    :band_id,
    :record_type,
    :name,
    presence: true,
  )

  belongs_to :band

  has_many :tracks, dependent: :destroy
end
