class Array

  def my_flatten
    flattened_array = []

    self.each do |el|
      if el.is_a?(Array)
        flattened_array.concat(el.my_flatten)
      else
        flattened_array << el
      end
    end

    flattened_array
  end

end
