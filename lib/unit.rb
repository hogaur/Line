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

  def to_mm
    if @unit == "cm"
      Measure.new(10.0, MM)
    elsif @unit == "m"
      Measure.new(1000.0, MM)
    else Measure.new(1.0, MM)
    end
  end

  def self.multiply unit1, unit2
    if unit1 != unit2
      unit1 = unit1.to_mm
      unit2 = unit2.to_mm
      return  Measure.new((unit1.numeral * unit2.numeral), unit1.unit.to_square)
    end
    Measure.new 1.0, unit1.to_square
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

  def self.add unit1, unit2
    if unit1 != unit2
      unit1 = unit1.to_mm
      unit2 = unit2.to_mm
      return Measure.new unit1.numeral+unit2.numeral, unit1.unit
    end
    Measure.new 1.0, unit1
  end
end
