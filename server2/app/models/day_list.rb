class DayList < ActiveRecord::Base
  has_many :day_list_words
  has_many :words, through: :day_list_words

  def self.list_of_today
    list = find_by active_on: Date.today
    if !list
      list = generate_list
    end
    list
  end

  def self.generate_list(date = Date.today)
    day_list = create active_on: date
    words = Word.least_used_words
    words = words.to_ary.shuffle[0..9]
    words.each do |word|
      DayListWord.create word: word, day_list: day_list
    end
    day_list
  end

end
