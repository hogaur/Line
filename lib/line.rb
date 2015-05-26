class Line
  attr_accessor :start_point, :end_point
  
  def initialize start_point, end_point
    @start_point = Point.new start_point.x, start_point.y
    @end_point = Point.new end_point.x, end_point.y
  end

  def length
    Point.distance_between @start_point, @end_point
  end
  
  def Line.equal? line1,line2
    (Point.equal? line1.start_point, line2.start_point and  Point.equal? line1.end_point, line2.end_point) or
      (Point.equal? line1.start_point, line2.end_point and  Point.equal? line1.end_point, line2.start_point)
  end

  def Line.orthogonal? line1, line2
    if line1.slope == "undefined"
      return line2.slope == 0
    elsif line2.slope == "undefined" 
      return line1.slope == 0 
    else
      line1.slope * line2.slope == -1
    end 

  end
  
  def slope
    if (@start_point.x-@end_point.x) == 0
      return "undefined"
    else
      return (@start_point.y-@end_point.y)/(@start_point.x-@end_point.x)
    end
  end
end
