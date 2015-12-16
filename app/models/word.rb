class Word < ActiveRecord::Base

  def self.least_used_words
    level = Word.select(:used_count).group(:used_count).order(used_count: :asc).first.used_count
    words = Word.where(used_count: level)
    if words.count < 10
        level += 1
        words = Word.where(used_count: level)
    end
    words
  end

end
