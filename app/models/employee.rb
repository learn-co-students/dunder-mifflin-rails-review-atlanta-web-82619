class Employee < ApplicationRecord
  belongs_to :dog
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :office, presence: true
  validates_uniqueness_of :alias
  validates_uniqueness_of :title
end
