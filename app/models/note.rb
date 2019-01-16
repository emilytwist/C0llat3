class Note < ApplicationRecord

	include PgSearch
  	multisearchable :against => [:content, :author]

	validates :content, presence: true
	validates :author, presence: true
	belongs_to :product
end
