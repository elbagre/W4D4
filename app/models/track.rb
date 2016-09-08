# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  track_type :string           not null
#  album_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  lyrics     :text
#

class Track < ActiveRecord::Base

  validates(
    :name,
    :track_type,
    :album_id,
    presence: true
  )

  belongs_to :album

  has_many :notes

  has_one(
    :band,
    through: :album,
    source: :band
  )
end
