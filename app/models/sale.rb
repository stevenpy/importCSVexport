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
    attributes = %w{email first_name last_name}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |sale|
        csv << attributes.map{ |attr| sale.send(attr) }
      end
    end
  end

	def self.assign_from_row(row)
		sale = Sale.where(email: row[:email]).first_or_initialize
		sale.assign_attributes row.to_hash.slice(:first_name, :last_name)
		sale
	end
end
