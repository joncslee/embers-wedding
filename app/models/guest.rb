class Guest < ActiveRecord::Base
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :token

  before_validation :generate_token

  def name
    "#{first_name} #{last_name}"
  end

  def address
    a = ""
    a += "#{address1}\r" if address1.present?
    a += "#{address2}\r" if address2.present?
    a += "#{city}, #{state} #{zipcode}"
    a
  end

  def not_coming?
    not_coming
  end

  def self.export_to_google_doc
    username = ENV['WEDDING_DOC_USERNAME']
    password = ENV['WEDDING_DOC_PASSWORD']
    session = GoogleDrive.login(username, password)

    ws = session.spreadsheet_by_key("0As1QuI50fA28dEdDaWRNeHV3bjNRTy1CT2h0aVBNU3c").worksheets[7]

    ws[1, 1] = 'Name'
    ws[1, 2] = 'Address'
    ws[1, 3] = 'Coming?'
    ws[1, 4] = 'Notes'
    self.all.each_with_index do |guest, i|
      ws[i + 2, 1] = guest.name
      ws[i + 2, 2] = guest.address
      ws[i + 2, 3] = guest.not_coming? ? 'No' : 'Yes'
      ws[i + 2, 4] = guest.notes
    end
    ws.save
  end

  private

  def generate_token
    unless self.token.present?
      charset = %w{ 2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z}
      self.token = (0...6).map{ charset.to_a[rand(charset.size)] }.join
    end
  end
end
