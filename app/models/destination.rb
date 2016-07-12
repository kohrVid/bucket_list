class Destination < ActiveRecord::Base
  belongs_to :traveller
#  belongs_to :bucket_list
  has_many :todo_items
  accepts_nested_attributes_for :todo_items

end
