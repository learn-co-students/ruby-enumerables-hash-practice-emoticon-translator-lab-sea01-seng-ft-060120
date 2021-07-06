
require "yaml"
require 'pry'


def load_library(file_path)
  # code goes here
  emoticons = YAML.load_file(file_path)
  emoticons_hash = {}
  
  emoticons.each do |key, value|
    emoticons_hash[key] = {}
    emoticons_hash[key][:english] = value[0]
    emoticons_hash[key][:japanese] = value[1]
    
  end
  emoticons_hash
end

def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  emoticon = library.keys.find do |key|
    library[key][:english] == emoticon
  end
  emoticon ? library[emoticon][:japanese] : "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  emoticon = library.keys.find do |key|
    library[key][:japanese] == emoticon
  end
  emoticon ? emoticon : "Sorry, that emoticon was not found"
end
