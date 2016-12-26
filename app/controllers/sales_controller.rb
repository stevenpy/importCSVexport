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
    redirect_to sales_path, notice: "Vous avez importez #{count} réservations avec succès !"
  end

  def show
  end

  def stats
    @reservation_number = Sale.distinct.count(:reservation)
    @client_number = Sale.select(:email).distinct.count
    @average_age = Sale.select(:email).distinct.average(:age)
    @average_prix = Sale.select(:email).distinct.average(:prix)
  end
end