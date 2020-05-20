require 'pry'
require "yaml" # require modules here

def load_library(emoticons)
  emoticons = YAML.load_file('./lib/emoticons.yml')
  trans = {}
  emoticons.each do |emoticon_name, array_of_symbols|
    array_of_symbols.each do |index|
      index
      
      if !trans[emoticon_name]
        trans[emoticon_name] = {}
      end
      trans[emoticon_name][:english] = array_of_symbols[0]
      trans[emoticon_name][:japanese] = array_of_symbols[1]
    end
  end
  trans
end

def get_japanese_emoticon(emoticons, english_version)
library = load_library(emoticons)
  library.each do |emoticon_name, meaning|
    if english_version == trans[emoticon_name][:english]
      trans[emoticon_name][:japanese]
    else "Sorry, that emoticon was not found"
    end
  end
end

def get_english_meaning
  # code goes here
end