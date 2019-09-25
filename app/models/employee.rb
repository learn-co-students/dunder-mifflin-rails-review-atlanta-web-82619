class Employee < ApplicationRecord
    belongs_to :dog
    accepts_nested_attributes_for :dog

    def full_name
        self.first_name + " " + self.last_name
    end

    def self.find_alias
        self.all.map { |e| e.alias }
    end

    def self.find_title
        self.all.map { |e| e.title }
    end
end
