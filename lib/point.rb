class Point
  attr_accessor :x, :y

  def initialize x, y
    @x = x
    @y = y
  end

  def Point.equal? point1, point2
    point1.x == point2.x and point1.y == point2.y
  end

  def Point.distance_between point1,point2
    Measure.new((Math.sqrt((point1.x-point2.x)**2+(point1.y-point2.y)**2)), Unit::MM)
  end
end
