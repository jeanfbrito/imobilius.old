class Property < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  has_many :pictures
  belongs_to :district

  def get_cover
  	cover = pictures.where(property_id: id, cover: true).first
    if cover
      return cover
    end
    false
  end

end