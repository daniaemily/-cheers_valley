class Winery < ApplicationRecord
  # validates :name, presence :true
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  mount_uploader :photo, PhotoUploader
  searchkick word_middle: [:name, :address]

  def search_data
    {
      name: name,
      address: address
    }
  end
end
