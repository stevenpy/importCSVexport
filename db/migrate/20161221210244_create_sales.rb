class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.integer :numero_billet
      t.integer :commande
      t.integer :reservation
      t.timestamp :date_reservation
      t.time :heure_reservation
      t.integer :cle_spectacle
      t.string :spectacle
      t.integer :cle_representation
      t.date :date_representation
      t.time :heure_representation
      t.date :date_fin_representation
      t.time :heure_fin_representation
      t.integer :prix
      t.date :date_acces
      t.time :heure_acces
      t.string :tarif
      t.string :type_de_client
      t.string :type_de_produit
      t.string :serie
      t.string :etage
      t.string :filiere_de_vente
      t.string :nom
      t.string :prenom
      t.string :email
      t.string :adresse
      t.integer :code_postal
      t.string :pays
      t.integer :age
      t.string :sexe

      t.timestamps
    end
  end
end
