class Destination < ActiveRecord::Base
  belongs_to :traveller
#  belongs_to :bucket_list
  has_many :todo_items, dependent: :destroy
  accepts_nested_attributes_for :todo_items
  def self.fields
    columns.map(&:name) - ["id", "created_at", "updated_at"]
 end
end
