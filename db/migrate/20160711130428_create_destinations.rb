class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :name
      t.text :image_url
      #t.references :traveller, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
