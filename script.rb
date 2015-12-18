#!/usr/bin/env ruby
require 'open-uri'
require 'nokogiri'
require 'pry'
require 'net/http'
require 'uri'

class String
    def string_between_markers marker1, marker2
        self[/#{Regexp.escape(marker1)}(.*?)#{Regexp.escape(marker2)}/m, 1]
    end
end


class FileProcessor
    
    def generate_words_array
        pageContent = Net::HTTP.get(URI.parse('http://scripton.herokuapp.com/words/daily'))
        wordsArray = pageContent.split("\n")
    end
    
    def parseHtml(word)
        url = 'http://en.bab.la/dictionary/german-english/' + word
        html = open(url)
        doc = Nokogiri::HTML(html)
        htmlParsed = doc.css("a[data-original-title='Listen']")
        return htmlParsed
    end
    
    def get_url_by(index, parsedHTML)
        
        word = parsedHTML[index]["href"]
        word = word.string_between_markers("(", ")")
        
        language = word.string_between_markers("'", "'")
        wordId =  word.partition(',').last
        
        wordUrl = "http://en.bab.la/sound/" + language + "/" + wordId + ".mp3"
        return wordUrl
    end
    
    def write_mp3_by_index(index, parsedHTML)
        url = get_url_by(index, parsedHTML)
        outname = File.basename(url)
        open(url) do |io|
            File.open(outname,'w+') {|out| out.print(io.read)}
        end
        return outname
    end
    
    def play_mp3_by(index, parsedHTML)
        outname = write_mp3_by_index(index, parsedHTML)
        system "mpg123 -q #{outname}"
    end
    
    def processWords(array)
        i = 0
        while i < array.size do
            word = array[i]
            begin
                html = parseHtml(normalizeWord(word))
                play_mp3_by(0, html)
                play_mp3_by(1, html)
                puts word
                rescue Exception => e
                puts 'translation for word [' + word + '] not found'
            end
            i += 1
            if i == array.size - 1
                i = 0
            end
        end
    end
        
    def normalizeWord(word)
        w = word.split.join(" ")
        return w
    end
end

l = FileProcessor.new
wordsArray = l.generate_words_array()
l.processWords(wordsArray)
