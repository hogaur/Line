require 'spec_helper'
describe 'Line' do
  it 'should declare a line with start_point and end_point' do
    line=Line.new [1,1],[2,2]
    expect(line.start_point).to eq([1,1])
    expect(line.end_point).to eq([2,2])
  end
  it 'should calculate the length of the line formed by start_point and end_point' do
    line=Line.new [1,1],[7,9]
    expect(line.length).to eq(10)
  end
end
