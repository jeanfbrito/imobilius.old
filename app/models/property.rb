class Property < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
end