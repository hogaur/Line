require 'spec_helper'

describe 'Square' do
  it 'should declare a square with pivot and one side' do
    pivot = Point.new 0,0
    side = 10
    square = Square.new_with_sides pivot, side
    expect(Point.equal? square.point1, pivot).to eq(true)
    expect(Point.equal? square.point2, Point.new(pivot.x + side, pivot.y)).to eq(true)
    expect(Point.equal? square.point3, Point.new(pivot.x + side, pivot.y + side)).to eq(true)
    expect(Point.equal? square.point4, Point.new(pivot.x, pivot.y + side)).to eq(true)
  end
  
  it 'should declare a square with four points' do
    point1 = Point.new 0, 0
    point2 = Point.new 2, 0
    point3 = Point.new 2, 2
    point4 = Point.new 0, 2
    square = Square.new point1, point2, point3, point4
    expect(Point.equal? square.point1, point1).to eq(true)
    expect(Point.equal? square.point2, point2).to eq(true)
    expect(Point.equal? square.point3, point3).to eq(true)
    expect(Point.equal? square.point4, point4).to eq(true)
  end

  it 'should not declare a rectangle with four invalid points' do
    point1 = Point.new 0, 0
    point2 = Point.new 2, 0
    point3 = Point.new 3, 4
    point4 = Point.new 0, 4
    square = Square.new point1, point2, point3, point4
    expect(square).to eq(nil)
  end

  describe 'area' do
    it 'should return area of the square' do
      point1 = Point.new 0, 0
      point2 = Point.new 2, 0
      point3 = Point.new 2, 2
      point4 = Point.new 0, 2
      square= Square.new point1, point2, point3, point4
      expect(square.area).to eq(4)
    end
  end

  describe 'perimeter' do
    it 'should return perimeter of the square' do
      point1 = Point.new 0, 0
      point2 = Point.new 2, 0
      point3 = Point.new 2, 2
      point4 = Point.new 0, 2
      square= Square.new point1, point2, point3, point4
      expect(square.perimeter).to eq(8)
    end
  end
end
