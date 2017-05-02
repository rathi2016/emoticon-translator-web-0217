# require modules here
require "yaml"

def load_library(yml_file)
emoticons = { "get_emoticon" => {}, "get_meaning"=>{} }
YAML.load_file(yml_file).each do |meaning, arr|
  emoticons["get_emoticon"][arr[0]] = arr[1]
  emoticons["get_meaning"][arr[1]] = meaning
end
emoticons
end

def get_japanese_emoticon(yml_file,emoticon)
  hash = load_library(yml_file)
  if hash["get_emoticon"].has_key?(emoticon)
     return hash["get_emoticon"][emoticon]
   else
     return "Sorry, that emoticon was not found"
   end

end

def get_english_meaning(yml_file,emoticon)
  hash = load_library(yml_file)
  if hash["get_meaning"].has_key?(emoticon)
    return hash["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
  
end
