require 'spec_helper'
describe 'Point' do
  it 'should declare a point with 2 coordinates' do
    point=Point.new 1,2
    expect(point.x).to eq(1)
    expect(point.y).to eq(2)
  end

  describe 'Equality' do
    it 'should return true for same point' do
      point1=Point.new 1,1
      point2=Point.new 1,1
      expect(Point.equal? point1,point2).to eq(true)
    end
    it 'should not return true for different points' do
      point1=Point.new 1,1
      point2=Point.new 1,2
      expect(Point.equal? point1,point2).to eq(false)
    end 
    it 'points should be symmetric' do
      point1=Point.new 1,1
      point2=Point.new 1,1
      expect(Point.equal? point1,point2).to eq(true)
      expect(Point.equal? point2,point1).to eq(true)
    end 
  end
  describe 'distance between points' do
    it 'should return the distance' do
      point1=Point.new 1,1
      point2=Point.new 4,5
      expect(Point.distance_between point1,point2).to eq(5)
    end
  end
end
