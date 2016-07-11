Traveller = Struct.new(:email, :password, :password_confirmation) do
  def self.create!
    Rails.logger.warn "N.B. Traveller is using a Struct"
    true
  end

end

