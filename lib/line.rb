class Line
  attr_accessor :start_point, :end_point
  def initialize start_point, end_point
    @start_point = start_point
    @end_point = end_point
  end
  def length
    dx=(@end_point[0]-@start_point[0]).abs
    dy=(@end_point[1]-@start_point[1]).abs
    return Math.sqrt(dx*dx+dy*dy)
  end
end
