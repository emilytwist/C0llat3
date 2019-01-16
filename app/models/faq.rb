class Faq < ApplicationRecord

	include PgSearch
  	multisearchable :against => [:question, :answer]

	validates :question, presence: true
	validates :answer, presence: true
	belongs_to :product
end
