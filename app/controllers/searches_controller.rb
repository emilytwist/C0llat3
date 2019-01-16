class SearchesController < ApplicationController

	def index
		@results = PgSearch.multisearch(:query)
	end
end
