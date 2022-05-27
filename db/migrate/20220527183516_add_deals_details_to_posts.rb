# frozen_string_literal: true

class AddDealsDetailsToPosts < ActiveRecord::Migration[7.0]
  def change
    change_table :posts, bulk: true do |t|
      t.string :link
      t.date :starting_date
      t.date :ending_date
      t.string :address
      t.string :categories, array: true, default: []
    end
  end
end
