require 'shuffle_method_time_frame'

describe 'Shuffle' do

  # it { is_expected.to respond_to(:new_shuffle) }
  it 'returns [1] when input [1]' do
    expect(new_shuffle).to eq [1]
  end
end