class SalesController < ApplicationController
  def index
		@sales = Sale.all
	end

	def import
	  count = Sale.import params[:file]
		redirect_to sales_path, notice: "Imported #{count} sales"
	end
end
