require 'rubygems'
require 'zip'
require 'json'
require 'trollop'
      
config = JSON.parse(File.read 'config.json')

options = { :directory => config["directory"], 
            :zipfile_name => config["zipfile_name"] }
opts = Trollop::options do
        opt:no, "NO_COMPRESSION"
        opt:best, "BEST_COMPRESSION"
        opt:default, "DEFAULT_COMPRESSION"
    end
  
  if opts[:no] == true
        x="NO_COMPRESSION"
        elsif opts[:best] == true
            x="BEST_COMPRESSION"
        elsif opts[:default] == true
            x="DEFAULT_COMPRESSION"
    end 
#Archive configuration

Zip.setup do |c|
    # Overwrite files
    c.on_exists_proc = true
    # Overwrite existing .zip files
    c.continue_on_exists_proc = true
    # Abbility to store archives with non-english names
    c.unicode_names = true
    # Compression level: Best => possible options: DEFAULT, BEST, NO        
    c.default_compression = Zlib::x
  end

Zip::File.open(config["zipfile_name"], Zip::File::CREATE) do |zipfile|
    Dir[File.join(config["directory"], '**', '**')].each do |file|
      zipfile.add(file.sub(config["directory"], ''), file)
    end
end
