# frozen_string_literal: true

class CreateAdvertisements < ActiveRecord::Migration[5.2]
  def change
    create_table :advertisements do |t|
      t.string :title
      t.text :content
      t.string :price
      t.string :dwelling_type
      t.string :postal_code
      t.string :street
      t.string :exterior_number
      t.string :interior_number
      t.string :colony
      t.string :municipality
      t.string :city
      t.string :state
      t.string :country
      t.references :user, index: true, foreign_key: true, null: false, unique: true
      t.boolean :status, default: true
      t.timestamps
    end
  end
end
