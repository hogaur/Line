require 'spec_helper'
describe 'Line' do
  it 'should declare a line with start_point and end_point' do
    point1 = Point.new 1, 1
    point2 = Point.new 2, 2
    line = Line.new point1, point2
    expect(Point.equal? line.start_point, point1).to eq(true)
    expect(Point.equal? line.end_point, point2).to eq(true)
  end

  it 'should not declare a line when start_point and end_point are same' do
    point1 = Point.new 1,1
    point2 = Point.new 1,1
    line = Line.new point1, point2
    expect(line).to eq(nil)
  end

  it 'should return length of the line' do
    point1 = Point.new 1, 1
    point2 = Point.new 4, 5
    line = Line.new point1, point2
    expect(line.length.numeral).to eq(5)
    expect(line.length.unit).to eq(Unit::MM)
  end

  describe 'equality' do
    it 'should return true for equal lines' do
      point1 = Point.new 1, 1
      point2 = Point.new 4, 5
      line1 = Line.new point1, point2
      line2 = Line.new point1, point2
      line3 = Line.new point2, point1
      expect(Line.equal? line1,line2).to eq(true)
      expect(Line.equal? line1,line3).to eq(true)
    end

    it 'should return false for different lines' do
      point1 = Point.new 1, 1
      point2 = Point.new 4, 5
      point3 = Point.new 2, 2
      line1 = Line.new point1, point2
      line2 = Line.new point1, point3
      expect(Line.equal? line1,line2).to eq(false)
    end
  end

  describe 'Orthogonality' do
    it 'should return true for perpendicular lines' do
      point1 = Point.new 0, 0
      point2 = Point.new 2, 0
      point3 = Point.new 0, 2
      line1 = Line.new point1, point2
      line2 = Line.new point1, point3
      expect(Line.orthogonal? line1, line2).to eq(true)
    end

    it 'should return false for not perpendicular lines' do
      point1 = Point.new 0, 4
      point2 = Point.new 0, 0
      point3 = Point.new 3, 4
      line1 = Line.new point1, point2
      line2 = Line.new point2, point3
      expect(Line.orthogonal? line1, line2).to eq(false)
    end

    it 'should return true for a set of perpendicular lines where one line is parallel to y axis' do
      point1 = Point.new 0, 4
      point2 = Point.new 0, 0
      point3 = Point.new 2, 0
      line1 = Line.new point1, point2
      line2 = Line.new point2, point3
      expect(Line.orthogonal? line1, line2).to eq(true)
      expect(Line.orthogonal? line2, line1).to eq(true)
    end
  end

  describe 'slope' do
    it 'should return the slope of the line' do
      point1 = Point.new 0, 0
      point2 = Point.new 2, 0
      line1 = Line.new point1, point2
      expect(line1.slope).to eq(0)
    end

    it 'should return undefined for a line parallel to y axis' do
      point1 = Point.new 0, 0
      point2 = Point.new 0, 2
      line1 = Line.new point1, point2
      expect(line1.slope).to eq("undefined")
    end
  end
end
