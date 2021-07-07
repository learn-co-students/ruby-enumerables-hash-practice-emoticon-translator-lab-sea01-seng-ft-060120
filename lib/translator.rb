# require modules here
require 'pry'
require "yaml"

def load_library(file_path)
  emoticons_hash ={}
  emoticons = YAML.load_file(file_path)
  emoticons.each do |key, value|
    emoticons_hash[key] = {:english => value[0], :japanese => value[1]}
  end
  emoticons_hash
end

def get_japanese_emoticon(file_path, emoticon)
  emoticon_library = load_library(file_path)
  emoticon_library.each do |key, value|
    return value[:japanese] if value[:english] == emoticon
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  emoticon_library = load_library(file_path)
  emoticon_library.each do |key, value|
    return key if value[:japanese] == emoticon
  end
  "Sorry, that emoticon was not found"
end