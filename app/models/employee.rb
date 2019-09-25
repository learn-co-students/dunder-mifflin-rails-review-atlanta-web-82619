class Employee < ApplicationRecord
    belongs_to :dog
    validates_uniqueness_of :alias, :title

    def full_name
        "#{self.first_name} #{self.last_name}"
    end
end
