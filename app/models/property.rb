class Property < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  has_many :pictures
  belongs_to :district

end