require "yaml"
require 'pry'
# require modules here




def load_library(file_path)
 file = File.read(file_path)
 hash = {}
 emoticons = YAML.load(file)
 emoticons.each do |key, value|
 hash[key] = {:english => value[0] ,:japanese => value[1]}
 end
hash
end  

def get_english_meaning(file_path, emoticon)
  emojis = load_library(file_path)
  emojis.each do |key, hash|
    if emojis[key][:japanese] == emoticon
    return key
  end
end
return "Sorry, that emoticon was not found"
end

def get_japanese_emoticon(file_path, emoticon)
  emojis = load_library(file_path)
  emojis.each do |key, hash|
    if emojis[key][:english] == emoticon
      return emojis[key][:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end
