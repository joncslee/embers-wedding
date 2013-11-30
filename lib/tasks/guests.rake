require 'csv'

task :guest_import => :environment do
  csv_text = File.read('lib/tasks/invitations.csv')
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    invitation = Invitation.create({:token => row[0]})
    if row[1].present? && row[2].present?
      invitation.guests.create({:last_name => row[1], :first_name => row[2]})
    end

    if row[3].present? && row[4].present?
      if row[3] == 'guest' && row[4] == 'an additional'
        invitation.guests.create
      else
        invitation.guests.create({:last_name => row[3], :first_name => row[4]})
      end
    end

    if row[5].present? && row[6].present?
      invitation.guests.create({:last_name => row[5], :first_name => row[6]})
    end

    if row[7].present? && row[8].present?
      invitation.guests.create({:last_name => row[7], :first_name => row[8]})
    end
  end
end

task :clear_guests_and_invitations => :environment do
  Invitation.delete_all
  Guest.delete_all
end
