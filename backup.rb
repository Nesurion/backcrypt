require 'rubygems'
require 'zip'

# Path to directory which should be backup 
directory = '/Users/kai/Desktop/test/'

# Destination path
zipfile_name = '/Users/kai/Desktop/archive.zip'

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

Zip::File.open(zipfile_name, Zip::File::CREATE) do |zipfile|
    Dir[File.join(directory, '**', '**')].each do |file|
      zipfile.add(file.sub(directory, ''), file)
    end
end
