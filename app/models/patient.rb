class Patient < ActiveRecord::Base
  has_one :user, as: :meta, dependent: :destroy
  has_many :appointments
  has_many :doctors, :through=> :appointments
  accepts_nested_attributes_for :user
end