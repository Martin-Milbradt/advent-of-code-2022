module Data
  def get_data(name)
    File.read("data/#{name}.txt").split("\n")
  end

  def get_data_int(name)
    get_data(name).map(&:to_i)
  end

  def get_data_string(name)
    File.read("data/#{name}.txt")
  end
end
