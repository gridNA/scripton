class WordsController < ApplicationController

  def daily
    @words = DayList.list_of_today.words
  end

end
