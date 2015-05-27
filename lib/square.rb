class Square < Rectangle
  def self.new_with_sides pivot, side
    super pivot, side, side
  end

  def self.valid? point1, point2, point3, point4
    line1 = Line.new point1, point2
    line4 = Line.new point4, point1
    super and (line1.length == line4.length)
  end
end
