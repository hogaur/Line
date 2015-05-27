require 'spec_helper'
describe 'Rectangle' do

  it 'should declare a rectangle with two sides' do
    length = Measure.new "10 mm"
    breadth = Measure.new "20 mm"
    rectangle= Rectangle.new_with_sides length, breadth
    puts "#{rectangle}"
    expect(Point.equal? rectangle.point1, Point.new(0, 0)).to eq(true)
    expect(Point.equal? rectangle.point2, Point.new(10, 0)).to eq(true)
    expect(Point.equal? rectangle.point3, Point.new(10, 20)).to eq(true)
    expect(Point.equal? rectangle.point4, Point.new(0, 20)).to eq(true)
  end

  it 'should declare a rectangle with four points' do
    point1 = Point.new 0, 0
    point2 = Point.new 2, 0
    point3 = Point.new 2, 4
    point4 = Point.new 0, 4
    rectangle= Rectangle.new point1, point2, point3, point4
    expect(Point.equal? rectangle.point1, point1).to eq(true)
    expect(Point.equal? rectangle.point2, point2).to eq(true)
    expect(Point.equal? rectangle.point3, point3).to eq(true)
    expect(Point.equal? rectangle.point4, point4).to eq(true)
  end

  it 'should not declare a rectangle with four invalid points' do
    point1 = Point.new 0, 0
    point2 = Point.new 2, 0
    point3 = Point.new 3, 4
    point4 = Point.new 0, 4
    rectangle = Rectangle.new point1, point2, point3, point4
    expect(rectangle).to eq(nil)
  end

  describe 'area' do
    it 'should return area of the rectangle' do
      point1 = Point.new 0, 0
      point2 = Point.new 2, 0
      point3 = Point.new 2, 4
      point4 = Point.new 0, 4
      rectangle= Rectangle.new point1, point2, point3, point4
      expect(rectangle.area.numeral).to eq(8)
      expect(rectangle.area.unit).to eq("mm2")
    end
  end

  describe 'perimeter' do
    it 'should return perimeter of the rectangle' do
      point1 = Point.new 0, 0
      point2 = Point.new 2, 0
      point3 = Point.new 2, 4
      point4 = Point.new 0, 4
      rectangle= Rectangle.new point1, point2, point3, point4
      expect(rectangle.perimeter.numeral).to eq(12)
      expect(rectangle.perimeter.unit).to eq("mm")
    end
  end
end
