class Product < ApplicationRecord
	validates :product_code, presence: true
	validates :description, presence: true

	has_one_attached :header_image
	has_many_attached :uploads
	has_many :notes, inverse_of: :product
	has_many :faqs, inverse_of: :product
	accepts_nested_attributes_for :notes
	accepts_nested_attributes_for :faqs
	has_and_belongs_to_many :groups
	accepts_nested_attributes_for :groups

	has_and_belongs_to_many :studies
	accepts_nested_attributes_for :studies
	has_many :categories, through: :studies

end