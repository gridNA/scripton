class WordsController < ApplicationController

  def daily
    @words = Word.first(10)
  end

end
