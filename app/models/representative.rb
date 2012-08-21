class Representative < ActiveRecord::Base
  belongs_to :political_party
  belongs_to :commisions
  attr_accessible :avatar, :district, :email, :name, :phone, :position
end
