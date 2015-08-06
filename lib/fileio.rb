require 'csv'

class FileIO
  def self.load_file(filename)
    CSV.open(filename, headers: true, header_converters: :symbol)
  end
end
