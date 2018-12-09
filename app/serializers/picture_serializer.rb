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

class PictureSerializer < ActiveModel::Serializer
  attributes :id, :imageName, :image , :imageable_id
end
