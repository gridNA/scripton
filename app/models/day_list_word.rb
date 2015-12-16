class DayListWord < ActiveRecord::Base
  belongs_to :word
  belongs_to :day_list

end
