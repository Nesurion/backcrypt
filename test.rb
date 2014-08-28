require 'rubygems'
require 'trollop'

opts = Trollop::options do
  opt :no, "BEST_COMPRESSION"
  opt :yes, "NO_COMPRESSION"

end

if opts[:no] == true
        x="NO_COMPRESSION"
        puts x
        elsif opts[:best] == true
            x="BEST_COMPRESSION"
        elsif opts[:default] == true
            x="DEFAULT_COMPRESSION"
    end 


