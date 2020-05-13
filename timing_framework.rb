require 'benchmark'

def time_framework
  results = []
  m = 5000
  while m <= 100_000
    array = Array(1..m).shuffle
    m += 5_000
    time = Benchmark.measure do
      array.sort
    end
    # changes time from seconds to miliseconds
    results.push(time.real * 1_000)
  end
  puts results
end

time_framework