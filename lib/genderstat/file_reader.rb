class FileReader
  def initialize file_name
    @file_name = file_name
  end

  def read
    IO.read @file_name
  end
end
