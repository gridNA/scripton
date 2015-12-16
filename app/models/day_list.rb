class DayList < ActiveRecord::Base
  has_many :day_list_words
  has_many :words, through: :day_list_words

  def self.list_of_today
    list = find_by date: Date.today
    if !list
      list = generate_list
    end
    list
  end

  def self.generate_list(date = Date.today)
    words = Word.least_used_words
    
  end


end
