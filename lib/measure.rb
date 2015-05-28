class Measure
  attr_accessor :numeral, :unit

  def initialize numeral, unit
    @numeral = numeral
    @unit = unit
  end

  def to_mm
    if @unit == Unit::CM
      Measure.new(10.0 * @numeral, Unit::MM)
    elsif @unit == Unit::M
      Measure.new(1000.0 * @numeral, Unit::MM)
    else self
    end
  end

  def self.equal? measure1, measure2
    measure1.numeral == measure2.numeral and measure1.unit == measure2.unit
  end

  def self.multiply measure1, measure2
    if measure1.unit != measure2.unit
      measure1 = measure1.to_mm
      measure2 = measure2.to_mm
    end
    Measure.new( measure1.numeral * measure2.numeral, measure1.unit.to_square)
  end

  def multiply_with_number number
    Measure.new (@numeral * number), @unit
  end

  def self.add measure1, measure2
    if measure1.unit != measure2.unit
      measure1 = measure1.to_mm
      measure2 = measure2.to_mm
    end
    Measure.new measure1.numeral+measure2.numeral, measure1.unit
  end
end
