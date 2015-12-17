class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :text

      t.timestamps
    end

    create_table :day_list_words do |t|
      t.belongs_to :word
      t.belongs_to :day_list
    end

    create_table :day_lists do |t|
      t.date :active_on
      t.timestamps
    end

  end
end
