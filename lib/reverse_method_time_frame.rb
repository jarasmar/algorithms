require 'benchmark'
require 'gchart'

class Array
  def new_reverse(array)
    new_array = []
    l = array.length
      while l > 0
        new_array.push(array[l-1])
        l -=1
      end
    new_array
  end
end

class Reverse < Array

  def reverse_original
    results = []
    m = 5000
    while m <= 100_000
      time = Benchmark.measure do
        array = Array(1..m).reverse
      end
      m += 5_000
      # takes the real time  and changes it from seconds to miliseconds
      results.push(time.real * 1_000)
    end
    results
  end

  def new_reverse_timer
    results = []
    m = 5000
    while m <= 100_000
      time = Benchmark.measure do
        array = new_reverse(Array(1..m))
      end
      m += 5_000
      # takes the real time  and changes it from seconds to miliseconds
      results.push(time.real * 1_000)
    end
    results
  end

  def new_reverse_two(string)
    array = string.split(//)
    new_array = []
    new_array << array.pop while array.length > 0
    new_array.join("")
  end

  def graph
    generate_graph = Gchart.new(
      :type => 'line',
      :size => '450x500',
      :bar_colors => ['6600cc','b366ff'],
      :title => "Time Framework for Reverse Method",
      :bg => 'EFEFEF',
      :legend => ['New Reverse', 'Original Reverse'],
      :data => [new_reverse_timer, reverse_original],
      :filename => 'images/reverse_method_graph.png',
      :stacked => false,
      :legend_position => 'bottom',
      :axis_with_labels => [['x'], ['y']],
      :max_value => 10,
      :min_value => 0,
      :axis_labels => [["0|20_000|40_000|60_000|80_000|100_000"]],
      )

    generate_graph.file
  end
end

a = Reverse.new
a.graph

p a.new_reverse_timer
p a.reverse_original