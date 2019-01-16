class Group < ApplicationRecord

	include PgSearch
  	multisearchable :against => [:name, :description]

	validates :name, presence: true
	validates :description, presence: true

	has_and_belongs_to_many :products
	accepts_nested_attributes_for :products

end
