class DayListWord < ActiveRecord::Base
  belongs_to :word
  belongs_to :day_list
  after_create :on_create
  after_destroy :on_destroy
  def on_create
    word.increment!(:used_count)
  end
  def on_destroy
    word.increment!(:used_count)
  end
end
