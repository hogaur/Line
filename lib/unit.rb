class Unit
  attr_accessor :unit

  def initialize unit
    @unit = unit
  end

  MM = Unit.new "mm"
  CM = Unit.new "cm"
  M =  Unit.new "m"
  MM2 = Unit.new "mm2"
  CM2 = Unit.new "cm2"
  M2 =  Unit.new "m2"

  def to_square
    if @unit == "m"
      M2
    elsif @unit == "cm"
      CM2
    else
      MM2
    end
  end
end
