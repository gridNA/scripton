class AddUsedCountToWords < ActiveRecord::Migration
  def change
    add_column :words, :used_count, :integer, default: 0
  end
end
