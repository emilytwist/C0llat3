class Study < ApplicationRecord
	validates :name, presence: true
	validates :description, presence: true

	has_and_belongs_to_many :categories
	accepts_nested_attributes_for :categories
	has_and_belongs_to_many :products
	accepts_nested_attributes_for :products

	has_one_attached :banner


end