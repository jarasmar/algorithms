require 'benchmark'
require 'gchart'

def time_framework
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
  :data => [time_framework],
  :filename => 'images/sort_graph.png',
  :stacked => false,
  :legend_position => 'bottom',
  :axis_with_labels => [['x'], ['y']],
  :max_value => 20,
  :min_value => 0,
  :axis_labels => [["0|25_000|50_000|75_000|100_000"]],
  )

 generate_graph.file
