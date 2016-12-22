class SalesController < ApplicationController
  def index
		@sales = Sale.all

		respond_to do |format|
			format.html
			format.csv { send_data @sales.to_csv, filename: "sales-#{Date.today}.csv" }
		end
	end

	def import
	  count = Sale.import params[:file]
		redirect_to sales_path, notice: "Imported #{count} sales"
	end
end
