require 'rubygems'
require 'zip'

# Path to directory which should be backup 
directory = '/<path>/<to>/<folder>'

# Destination path
zipfile_name = '/<path>/<to>//backup.zip'

Zip::File.open(zipfile_name, Zip::File::CREATE) do |zipfile|
    Dir[File.join(directory, '**', '**')].each do |file|
      zipfile.add(file.sub(directory, ''), file)
    end
end
