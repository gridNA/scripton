class String
  def format_word!
    slice! "der"
    slice! "die"
    slice! "das"
    strip!
  end
end
