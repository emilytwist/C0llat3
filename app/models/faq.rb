class Faq < ApplicationRecord
	validates :question, presence: true
	validates :answer, presence: true
	belongs_to :product
end
