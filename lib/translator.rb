# require modules here
require "yaml"
require 'pry'

def load_library(file_path)
  emoticons = YAML.load_file(file_path) 
   new_hash = {} 

emoticons.each  do |key, value| 
  new_hash[key] = {}    
   new_hash[key][:english] = value[0] 
   new_hash[key][:japanese] = value[1] 
end
new_hash
end


def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  result = load_library(file_path)
  meaning = result.keys.find do |key|
    result[key][:english] == emoticon
  end
  if meaning
    return result [meaning][:japanese]
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  result = load_library(file_path)
  meaning = result.keys.find do |key|
    result[key][:japanese] == emoticon
  end
  if meaning
    return meaning
  end
  "Sorry, that emoticon was not found"
end