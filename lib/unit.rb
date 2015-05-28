class Unit
  attr_accessor :unit, :conversion_factor

  def initialize unit, conversion_factor
    @unit = unit
    @conversion_factor = conversion_factor
  end


  def to_square
    if @unit == "m"
      M2
    elsif @unit == "cm"
      CM2
    else
      MM2
    end
  end

  def to_mm number
    number * @conversion_factor
  end
end

Unit::MM = Unit.new "mm", 1
Unit::CM = Unit.new "cm", 10
Unit::M =  Unit.new "m", 1000
Unit::MM2 = Unit.new "mm2", 1
Unit::CM2 = Unit.new "cm2", 100
Unit::M2 =  Unit.new "m2", 1000000
