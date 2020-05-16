
class Reverse
  def new_reverse(array)
    new_array = []
    l = array.length
      while l > 0
        new_array.push(array[l-1])
        l -=1
      end
    new_array
  end
  
  def new_reverse_two(string)
    array = string.split(//)
    new_array = []
    new_array << array.pop while array.length > 0
    new_array.join("")
  end
end