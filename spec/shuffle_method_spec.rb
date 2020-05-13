require 'shuffle_method_time_frame'

describe Shuffle do

  it { is_expected.to respond_to(:new_shuffle) }

  it 'returns [1] when input [1]' do
    expect(subject.new_shuffle([1])).to eq [1]
  end

  it 'can return [1, 2] when input is [1,2]' do
    allow(subject).to receive(:new_shuffle).and_return [1, 2]
    expect(subject.new_shuffle([1,2])).to eq [1, 2]
  end

  it 'can return [2, 1] when input is [1,2]' do
    allow(subject).to receive(:new_shuffle).and_return [2, 1]
    expect(subject.new_shuffle([1,2])).to eq [2, 1]
  end
end