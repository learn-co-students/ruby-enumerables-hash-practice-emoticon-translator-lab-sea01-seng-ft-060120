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
  library.each do |emoticon_name, hash_value|
    hash_value.each do |language, meaning|
    #binding.pry
      if english_version == library[emoticon_name][:english][meaning]
        return library[emoticon_name][:japanese]
      end
    end
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(emoticons, japanese_version)
  library = load_library(emoticons)
  library.each do |emoticon_name, hash_value|
    if japanese_version == hash_value[:japanese]
      return emoticon_name
    end
  end
      "Sorry, that emoticon was not found"
end