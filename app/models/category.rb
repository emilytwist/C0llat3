class Category < ApplicationRecord

	include PgSearch
  	multisearchable :against => [:name, :description]

	validates :name, presence: true
	validates :description, presence: true

	has_and_belongs_to_many :studies
	accepts_nested_attributes_for :studies
	has_many :products, through: :studies

end
