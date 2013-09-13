class Person < ActiveRecord::Base
  has_one :address
  validates :first_name, :last_name, :phone, presence: true

  def name
    [first_name, last_name].join(' ')
  end

  accepts_nested_attributes_for :address
end
