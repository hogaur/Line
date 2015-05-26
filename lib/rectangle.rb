class Rectangle
  attr_accessor :point1, :point2, :point3, :point4

  def self.new point1, point2, point3, point4
    line1=Line.new point1, point2
    line2=Line.new point2, point3
    line3=Line.new point3, point4
    line4=Line.new point4, point1

    return nil unless (
      (Line.orthogonal? line1, line2) and
      (Line.orthogonal? line3, line4) and
      (line1.length == line3.length) and
      (line2.length == line4.length)
    )
    super
  end

  def initialize point1, point2, point3, point4
    @point1 = point1
    @point2 = point2
    @point3 = point3
    @point4 = point4
  end
end
