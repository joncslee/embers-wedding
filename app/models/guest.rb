class Guest < ActiveRecord::Base
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :token

  before_validation :generate_token

  def name
    "#{first_name} #{last_name}"
  end

  private

  def generate_token
    unless self.token.present?
      charset = %w{ 2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z}
      self.token = (0...6).map{ charset.to_a[rand(charset.size)] }.join
    end
  end
end
