class Rectangle
  attr_accessor :point1, :point2, :point3, :point4

  def self.new *args
    puts "#{args}"
    if args[0].is_a?(Point) and args[1].is_a?(Fixnum) and args[2].is_a?(Fixnum)
      super
    else
      line1=Line.new args[0], args[1]
      line2=Line.new args[1], args[2]
      line3=Line.new args[2], args[3]
      line4=Line.new args[3], args[0]

      return nil unless (
        (Line.orthogonal? line1, line2) and
        (Line.orthogonal? line3, line4) and
        (line1.length == line3.length) and
        (line2.length == line4.length)
      )
      super
    end
  end

  def initialize *args
    if args[0].is_a?(Point) and args[1].is_a?(Fixnum) and args[2].is_a?(Fixnum)
      @point1 = args[0]
      @point2 = Point.new(args[0].x+args[1], args[0].y)
      @point3 = Point.new(args[0].x+args[1], args[0].y+args[2])
      @point4 = Point.new(args[0].x, args[0].y+args[2])
    else
      @point1 = args[0]
      @point2 = args[1]
      @point3 = args[2]
      @point4 = args[3]
    end
  end

  def area
    line1 = Line.new @point1, @point2
    line2 = Line.new @point2, @point3
    return line1.length * line2.length
  end

  def perimeter
    line1 = Line.new @point1, @point2
    line2 = Line.new @point2, @point3
    return 2 * (line1.length + line2.length)
  end
end
