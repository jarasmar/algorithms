require 'benchmark'
require 'gchart'

class Array
  def new_shuffle(array)
    shuffle_array = []

    while array.length > 0 do
      length = array.length - 1
      index = rand(0..length)
      shuffle_array << array[index]
      array.delete_at(index)
    end
    shuffle_array
  end
end

class Shuffle < Array

  def shuffle_original
    results = []
    m = 5000
    while m <= 100_000
      time = Benchmark.measure do
        array = Array(1..m).shuffle
      end
      m += 5_000
      # takes the real time  and changes it from seconds to miliseconds
      results.push(time.real * 1_000)
    end
    results
  end

  def new_shuffle_time
    results = []
    m = 5000
    while m <= 100_000
      time = Benchmark.measure do
        array = new_shuffle(Array(1..m))
      end
      m += 5_000
      # takes the real time  and changes it from seconds to miliseconds
      results.push(time.real * 1_000)
    end
    results
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
      :max_value => 500,
      :min_value => 0,
      :axis_labels => [["0|20_000|40_000|60_000|80_000|100_000"]],
      )

    generate_graph.file
  end
end

a = Shuffle.new
a.graph

p a.new_shuffle_time
p a.shuffle_original


