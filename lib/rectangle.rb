class Rectangle
  attr_accessor :point1, :point2, :point3, :point4

  def self.new_with_sides length, breadth
    point1 = Point.new 0, 0
    point2 = Point.new(point1.x+length.numeral, point1.y)
    point3 = Point.new(point1.x+length.numeral, point1.y+breadth.numeral)
    point4 = Point.new(point1.x, point1.y+breadth.numeral)
    self.new point1, point2, point3, point4
  end

  def self.new point1, point2, point3, point4
    if self.valid? point1, point2, point3, point4
      super
    else return nil
    end
  end

  def self.valid? point1, point2, point3, point4
    line1=Line.new point1, point2
    line2=Line.new point2, point3
    line3=Line.new point3, point4
    line4=Line.new point4, point1

    (
      (Line.orthogonal? line1, line2) and
      (Line.orthogonal? line3, line4) and
      (Measure.equal? line1.length, line3.length) and
      (Measure.equal? line2.length, line4.length)
    )
  end

  def initialize point1, point2, point3, point4
    @point1 = point1
    @point2 = point2
    @point3 = point3
    @point4 = point4
  end

  def area
    line1 = Line.new @point1, @point2
    line2 = Line.new @point2, @point3
    return Measure.multiply line1.length, line2.length
  end

  def perimeter
    line1 = Line.new @point1, @point2
    line2 = Line.new @point2, @point3
    return (Measure.add line1.length, line2.length).multiply_with_number 2
  end
end
