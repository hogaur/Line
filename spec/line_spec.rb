require 'spec_helper'
describe 'Line' do
  it 'should declare a line with start_point and end_point' do
    point1 = Point.new 1, 1
    point2 = Point.new 2, 2
    line=Line.new point1, point2
    expect(Point.equal? line.start_point, point1).to eq(true)
    expect(Point.equal? line.end_point, point2).to eq(true)
  end
  it 'should return length of the line' do
    point1 = Point.new 1, 1
    point2 = Point.new 4, 5
    line=Line.new point1, point2
    expect(line.length).to eq(5)
  end
  describe 'equality' do
    it 'should return true for equal lines' do
      point1 = Point.new 1, 1
      point2 = Point.new 4, 5
      line1=Line.new point1, point2
      line2=Line.new point1, point2
      line3=Line.new point2, point1
      expect(Line.equal? line1,line2).to eq(true)
      expect(Line.equal? line1,line3).to eq(true)
    end
  end
end
