require 'benchmark'
require 'gchart'

class Array
  def new_shuffle_one(array)
    shuffle_array = []

    while array.length > 0 do
      length = array.length - 1
      index = rand(0..length)
      shuffle_array << array[index]
      array.delete_at(index)
    end
    shuffle_array
  end

  def new_shuffle_two(array)
    new_array = []
    until array.empty? do
      random_index = rand array.length
      new_array << array[random_index]
      array[random_index], array[-1] = array[-1], array[random_index]
      array.pop
    end
    new_array
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

  def new_shuffle_one_time
    results = []
    m = 5000
    while m <= 100_000
      time = Benchmark.measure do
        array = new_shuffle_one(Array(1..m))
      end
      m += 5_000
      # takes the real time  and changes it from seconds to miliseconds
      results.push(time.real * 1_000)
    end
    results
  end

  def new_shuffle_two_time
    results = []
    m = 5000
    while m <= 100_000
      time = Benchmark.measure do
        array = new_shuffle_two(Array(1..m))
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
      :bar_colors => ['6600cc','b366ff', '330066'],
      :title => "Time Framework for Shuffle Method",
      :bg => 'EFEFEF',
      :legend => ['New Shuffle One', 'New Shuffle Two', 'Original Shuffle'],
      :data => [new_shuffle_one_time, new_shuffle_one_time, shuffle_original],
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
