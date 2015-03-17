class Doctor < ActiveRecord::Base
  has_one :user, as: :meta, dependent: :destroy
  has_many :appointments
  has_many :patients, :through=> :appointments
  accepts_nested_attributes_for :user
end
