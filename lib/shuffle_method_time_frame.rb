require 'benchmark'
require 'gchart'

class Array
  def rotation(m)
    rotate(rand(m))
  end
  
end
  
  # def new_shuffle(array)
  #   shuffle_array = []

  #   while array.length > 0 do
  #     length = array.length - 1
  #     index = rand(0..length)
  #     shuffle_array << array[index]
  #     array.delete_at(index)
  #   end
  #   shuffle_array
  # end

class Shuffle < Array

  def shuffle_original
    # results = []
    m = 5000
    while m <= 100000
      # a = Process.clock_gettime(Process::CLOCK_MONOTONIC)*1000
      Array(1..m).shuffle
      # b = Process.clock_gettime(Process::CLOCK_MONOTONIC)*1000
      m += 5_000
      # results.push((b-a))
    end
    # results
  end

  def new_shuffle_time
    # results = []
    m = 5000
    while m <= 100_000
    #  a = Process.clock_gettime(Process::CLOCK_MONOTONIC)*1000
       Array(1..m).rotation(1000)
    #  b = Process.clock_gettime(Process::CLOCK_MONOTONIC)*1000
      m += 5_000
      # results.push((b-a))
    end
    #  results
  end


  def graph
    generate_graph = Gchart.new(
      :type => 'line',
      :size => '450x500',
      :bar_colors => ['6600cc','b366ff'],
      :title => "Time Framework for Shuffle Method",
      :bg => 'EFEFEF',
      :legend => ['New Shuffle', 'Original Shuffle'],
      :data => [new_shuffle_time, shuffle_original],
      :filename => 'images/shuffle_method_graph.png',
      :stacked => false,
      :legend_position => 'bottom',
      :axis_with_labels => [['x'], ['y']],
      :max_value => 5,
      :min_value => 0,
      :axis_labels => [["0|20_000|40_000|60_000|80_000|100_000"]],
      )
    generate_graph.file
  end

  def start
    Process.clock_gettime(Process::CLOCK_MONOTONIC)*1000
    end
   def ending
   Process.clock_gettime(Process::CLOCK_MONOTONIC)*1000
   end

  def timer_function(name_method, times)
    results = []
   a = Process.clock_gettime(Process::CLOCK_MONOTONIC)*1000
    self.send(name_method)
   b =  Process.clock_gettime(Process::CLOCK_MONOTONIC)*1000
    return results.push(b-a)
  end

end



a = Shuffle.new
p a.timer_function(:new_shuffle_time)
p a.timer_function(:shuffle_original)

# p a.new_shuffle_time
# p a.shuffle_original