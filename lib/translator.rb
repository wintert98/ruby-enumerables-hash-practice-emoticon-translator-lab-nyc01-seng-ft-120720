# require modules here
require 'yaml'
require 'pry'

def load_library(path)
  emoticons = YAML.load_file(path)
  
  emoticon_hash = {}

  emoticons.each do |meaning, emoticon|
    
   emoticon_hash.merge!({meaning => {
     :english => "#{emoticon[0]}",
    :japanese => "#{emoticon[1]}"
      
   }})
     
  end
  
  emoticon_hash
  
 
end

def get_english_meaning(path, emoticon)
  emoticon_hash = load_library(path)
   emoticon = emoticon_hash.keys.find do |key|
     emoticon_hash[key][:japanese] == emoticon
   end
   
   emoticon ? emoticon : "Sorry, that emoticon was not found"
 end
 
 

def get_japanese_emoticon(path, emoticon)
  emoticon_hash = load_library(path)
  emoticon = emoticon_hash.keys.find do |key|
    emoticon_hash[emoticon][:english] == emoticon
  end
  #binding.pry
  emoticon ? emoticon_hash[emoticon][:japanese]: "Sorry, that emoticon was not found"
  
end

