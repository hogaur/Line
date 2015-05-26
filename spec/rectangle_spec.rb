require 'spec_helper'
describe 'Rectangle' do
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
end
