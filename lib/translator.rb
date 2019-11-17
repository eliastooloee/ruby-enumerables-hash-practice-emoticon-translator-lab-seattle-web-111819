require 'yaml'
require 'pry'

def load_library(file_path)
  emoticons = {"get_meaning" => {}, "get_emoticon" => {} }
  YAML.load(file_path).each do |meaning, describe|
    eng, jap =describe
    emoticons["get_meaning"] [jap]=meaning
    emoticons["get_emoticon"] [eng]=jap
  end
end

def get_japanese_emoticon(file_path, emoticon)
  emoticons=load_library(file_path)
  result=emoticons["get_emoticon"] [emoticon]
  if result
    result
  else
   "Sorry, that emoticon was not found" 
 end
end

def get_english_meaning(file_path, emoticon)
  emoticons=load_library(file_path)
  j_emoticon= emoticons.find {|name, faces| faces[1]==emoticon}
  j_emoticon==nil ? "Sorry, that emoticon was not found" : j_emoticon[0]
end