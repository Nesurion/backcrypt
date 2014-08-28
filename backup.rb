require 'rubygems'
require 'zip'
require 'yaml'

def read_config
    config = YAML.load_file("config.yaml")
    @directory = config["config"]["directory"]
    @zip_path = config["config"]["zip_path"]
end   

read_config           
# Path to directory which should be backup 
#directory = '/Users/kai/Desktop/test/'

# Destination path
#zipfile_name = '/Users/kai/Desktop/archive.zip'

# Archive configuration
Zip.setup do |c|
    # Overwrite files
    c.on_exists_proc = true
    # Overwrite existing .zip files
    c.continue_on_exists_proc = true
    # Abbility to store archives with non-english names
    c.unicode_names = true
    # Compression level: Best possible options: DEFAULT, BEST, NO
    c.default_compression = Zlib::BEST_COMPRESSION
  end

Zip::File.open(@zip_path, Zip::File::CREATE) do |zipfile|
    Dir[File.join(@directory, '**', '**')].each do |file|
      zipfile.add(file.sub(@directory, ''), file)
    end
end
