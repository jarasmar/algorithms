require 'benchmark'
require 'gchart'

def sort_time_frame
  results = []
  m = 5000
  while m <= 100_000
    array = Array(1..m).shuffle
    m += 5_000
    time = Benchmark.measure do
      array.sort
    end
    # takes the real time  and changes it from seconds to miliseconds
    results.push(time.real * 1_000)
  end
  results
end

generate_graph = Gchart.new(
  :type => 'line',
  :size => '450x500',
  :bar_colors => ['6600cc','b366ff'],
  :title => "Time Framework for Sort Method",
  :bg => 'EFEFEF',
  :legend => ['Sort Method'],
  :data => [sort_time_frame],
  :filename => 'images/sort_method_graph.png',
  :stacked => false,
  :legend_position => 'bottom',
  :axis_with_labels => [['x'], ['y']],
  :max_value => 20,
  :min_value => 0,
  :axis_labels => [["0|20_000|40_000|60_000|80_000|100_000"]],
  )

 generate_graph.file
