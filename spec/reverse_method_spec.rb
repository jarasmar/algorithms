require 'reverse_method_time_frame'

describe Reverse do

  it { is_expected.to respond_to(:new_reverse) }

  it 'returns [1] when input [1]' do
    expect(subject.new_reverse([1])).to eq [1]
  end

  it 'can return [2, 1] when input is [1,2]' do
    expect(subject.new_reverse([1,2])).to eq [2, 1]
  end

  it 'can return [3, 2, 1] when input is [1,2,3]' do
    expect(subject.new_reverse([1,2,3])).to eq [3, 2, 1]
  end
end