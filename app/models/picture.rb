# == Schema Information
#
# Table name: pictures
#
#  id             :integer          not null, primary key
#  pictureType    :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  pictureUrl     :string
#  imageable_type :string
#  imageable_id   :integer
#

class Picture < ApplicationRecord
    mount_uploader :image, ImageUploader
    
    #validates :pictureType, presence: true, length: { minimum: 2 }, 
                   # format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/, 
                  #      message: "only allows letters" }
    
    #validates :pictureUrl, presence: true, length: {minimum: 10}

    belongs_to :imageable, polymorphic: true, optional: true

end
