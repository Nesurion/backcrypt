require 'json'

config = JSON.parse(File.read ' config.json')

options = { :name 			=> config["name"],
			:path 			=> config["path"],
			:compression	=>["compression"] 
}

