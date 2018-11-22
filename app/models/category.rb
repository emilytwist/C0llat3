class Category < ApplicationRecord
	validates :name, presence: true
	validates :description, presence: true

	has_and_belongs_to_many :studies
	accepts_nested_attributes_for :studies

end
