class Measure

  attr_accessor :numeral, :unit
  def initialize measure_string
    split_string = measure_string.split(" ")
    @numeral = Float(split_string[0])
    @unit = split_string[1]
  end
  def to_mm
    if @unit == "cm"
      Measure.new("#{@numeral*10} mm")
    elsif @unit == "m"
      Measure.new("#{@numeral*1000} mm")
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
    Measure.new "#{measure1.numeral * measure2.numeral} mm2"
  end

  def multiply_with_number number
    Measure.new "#{number * @numeral} #{@unit}"
  end

  def self.add measure1, measure2
    if measure1.unit != measure2.unit
      measure1 = measure1.to_mm
      measure2 = measure2.to_mm
    end
    Measure.new "#{measure1.numeral + measure2.numeral} mm"
  end
end
