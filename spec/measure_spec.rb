require 'spec_helper'

describe 'Measure' do
  it 'should create a measure of given length and unit' do
    measure = Measure.new 100,Unit::CM
    expect(measure.numeral == 100.0).to eq(true)
    expect(measure.unit == Unit::CM).to eq(true)
  end

  describe 'to_mm' do
    it 'should convert the given measure in cm to mm' do
      measure = Measure.new 100, Unit::CM
      expect(measure.to_mm.numeral == 1000.0).to eq(true)
      expect(measure.to_mm.unit == Unit::MM).to eq(true)
    end
    it 'should convert the given measure in m to mm' do
      measure = Measure.new 100, Unit::M
      expect(measure.to_mm.numeral == 100000.0).to eq(true)
      expect(measure.to_mm.unit == Unit::MM).to eq(true)
    end
  end

  describe 'Equality' do
    it 'should return true for objects with same numeral and unit' do
      length1 = Measure.new 100, Unit::CM
      length2 = Measure.new 100, Unit::CM
      expect(Measure.equal? length1, length2).to eq(true)
    end
    it 'should not return true for objects with same numeral but different unit' do
      length1 = Measure.new 100, Unit::CM
      length2 = Measure.new 100, Unit::MM
      expect(Measure.equal? length1, length2).to eq(false)
    end
    it 'should not return true for objects with different numeral but same unit' do
      length1 = Measure.new 10, Unit::CM
      length2 = Measure.new 100, Unit::CM
      expect(Measure.equal? length1, length2).to eq(false)
    end
    it 'should be symmetric' do
      length1 = Measure.new 100, Unit::CM
      length2 = Measure.new 100, Unit::MM
      expect(Measure.equal? length1, length2).to eq(false)
      expect(Measure.equal? length2, length1).to eq(false)
    end
  end

  describe 'Multiplication' do
    it 'should return multiplication of two Measure objects' do
      length = Measure.new 1, Unit::CM
      breadth = Measure.new 10, Unit::MM
      area = Measure.multiply length, breadth
      expect(area.numeral).to eq(100.0)
      expect(area.unit).to eq(Unit::MM2)
    end
  end

  describe 'Multiplication with a number' do
    it 'should return a measure with a numberal multiplied by given number' do
      measure = Measure.new 10, Unit::MM
      result = measure.multiply_with_number 2
      expect(result.numeral == 20).to eq(true)
      expect(result.unit == Unit::MM).to eq(true)
    end
  end

  describe 'Addition' do
    it 'should return addition of two Measure objects' do
      length1 = Measure.new 1, Unit::CM
      length2 = Measure.new 10, Unit::MM
      sum_length = Measure.add length1, length2
      expect(sum_length.numeral == 20).to eq(true)
      expect(sum_length.unit == Unit::MM).to eq(true)
    end
  end
end
