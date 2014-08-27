require 'rubygems'
require 'zip'

# Path to directory which should be backup 
directory = '/Users/kai/Desktop/test/'

# Destination path
zipfile_name = '/Users/kai/Desktop/archive.zip'

Zip.on_exists_proc = true
Zip.continue_on_exists_proc = true

Zip::File.open(zipfile_name, Zip::File::CREATE) do |zipfile|
    Dir[File.join(directory, '**', '**')].each do |file|
      zipfile.add(file.sub(directory, ''), file)
    end
end
