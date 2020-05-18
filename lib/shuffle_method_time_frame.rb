# Time framework with build-in graphical outcome. 
# Refactorizacion will be done in further steps of the project.

require 'benchmark'
require 'gchart'

class Array
  def new_shuffle
    rotate(rand(1000))
  end
  
end


class Shuffle < Array

  attr_reader :results, :results_list

  def initialize
    @results = []
    @results_list = []
  end


  def method_timer(name)
    @results = []
      m = 5000
      while m <= 100000
        time = Benchmark.measure do
        Array(1..m).send(name)
        end
       m += 5_000
       @results.push(time.real * 1000)
      end
     @results[3..15]
  end



  def graph
    generate_graph = Gchart.new(
      :type => 'line',
      :size => '450x500',
      :bar_colors => ['6600cc','b366ff'],
      :title => "Time Framework for Shuffle Method",
      :bg => 'EFEFEF',
      :legend => ['New Shuffle', 'Original Shuffle'],
      :data => [method_timer(:new_shuffle), method_timer(:shuffle)],
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

  
end
a = Shuffle.new
p a.method_timer(:shuffle)
p a.method_timer(:new_shuffle)
a.graph




#----------------------------------------
#EXPERIMENTAL METHODS



  # def method_timer(name)
  #   @results = []
  #     m = 5000
  #     while m <= 1000000
  #       a = Process.clock_gettime(Process::CLOCK_MONOTONIC)*1000
  #       Array(1..m).send(name)
  #       b = Process.clock_gettime(Process::CLOCK_MONOTONIC)*1000
  #      m += 5_000
  #      @results_list.push(@results.push((b-a)))
  #     end
  #   @results_list[9][2..17]
  # end


# def start
  #   Process.clock_gettime(Process::CLOCK_MONOTONIC)*1000
  #   end
  #  def ending
  #  Process.clock_gettime(Process::CLOCK_MONOTONIC)*1000
  #  end



  # def timer_function(name_method, rounds)
  #   global_results = [] # Para meter el resultado del medio o los previos. No utilizado de momento el prubin.
  #   result = [] # resultados de las rondas de tiempo.
  #   rounds.times do
  #  a = Process.clock_gettime(Process::CLOCK_MONOTONIC)*1000
  #   self.send(name_method)
  #  b =  Process.clock_gettime(Process::CLOCK_MONOTONIC)*1000
  #   result.push(b-a)
  #   end
  #   result
  # end



  
  # def data_average(name_method)
  #   results = []
  #   median_results = []
  #   21.times do 
  #     results.push(method_timer.send(name_method))
  #   end 
  #   median_results.push(results[results.length/2])
  # end



  # def times_shuffle
  #   n = 2
  #   while n > 0 do 
  #    method_timer(:shuffle)
  #     n -= 1
  #   end 
  #   @results
  # end

    
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

    # def shuffle_original
  #   # results = []
  #   m = 5000
  #   while m <= 100000
  #     # a = Process.clock_gettime(Process::CLOCK_MONOTONIC)*1000
  #     Array(1..m).shuffle
  #     # b = Process.clock_gettime(Process::CLOCK_MONOTONIC)*1000
  #     m += 5_000
  #     # results.push((b-a))
  #   end
  #   # results
  # end