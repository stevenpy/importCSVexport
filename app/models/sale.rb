class Sale < ApplicationRecord

	def self.import(file)
		counter = 0
		CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row|
			sale = Sale.assign_from_row(row)
			if sale.save
				counter += 1
			else
				puts "#{sale.email} - #{sale.errors.full_messages.join(",")}"
			end
		end
		counter
	end

	def self.to_csv
    attributes = %w{numero_billet commande reservation date_reservation heure_reservation cle_spectacle spectacle cle_representation date_representation heure_representation date_fin_representation heure_fin_representation prix date_acces heure_acces tarif type_de_client type_de_produit serie etage filiere_de_vente nom prenom email adresse code_postal pays age sexe}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |sale|
        csv << attributes.map{ |attr| sale.send(attr) }
      end
    end
  end

  def self.assign_from_row(row)
  	sale = Sale.where(numero_billet: row[:numero_billet]).first_or_initialize
  	sale.assign_attributes row.to_hash.slice(:commande, :reservation, :date_reservation, :heure_reservation, :cle_spectacle, :spectacle, :cle_representation, :date_representation, :heure_representation, :date_fin_representation, :heure_fin_representation, :prix, :date_acces, :heure_acces, :tarif, :type_de_client, :type_de_produit, :serie, :etage, :filiere_de_vente, :nom, :prenom, :email, :adresse, :code_postal, :pays, :age, :sexe)
  	sale
  end
end