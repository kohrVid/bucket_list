BucketList = Struct.new(:name) do
  has_many :destinations
  accepts_nested_attributes_for :destination
  def self.new
    Rails.logger.warn "N.B. BucketList is using a Struct"
    true
  end

  def self.create!
    Rails.logger.warn "N.B. BucketList is using a Struct"
    true
  end

end

