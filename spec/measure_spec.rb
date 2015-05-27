require 'spec_helper'

describe 'Measure' do
  it 'should create a measure of given length and unit' do
    measure = Measure.new "100 cm"
    expect(measure.numeral == 100.0).to eq(true)
    expect(measure.unit == "cm").to eq(true)
  end

  describe 'to_mm' do
    it 'should convert the given measure in cm to mm' do
      measure = Measure.new "100 cm"
      expect(measure.to_mm.numeral == 1000.0).to eq(true)
      expect(measure.to_mm.unit == "mm").to eq(true)
    end
    it 'should convert the given measure in m to mm' do
      measure = Measure.new "100 m"
      expect(measure.to_mm.numeral == 100000.0).to eq(true)
      expect(measure.to_mm.unit == "mm").to eq(true)
    end
  end

  describe 'Equality' do
    it 'should return true for objects with same numeral and unit' do
      length1 = Measure.new "100 cm"
      length2 = Measure.new "100 cm"
      expect(Measure.equal? length1, length2).to eq(true)
    end
    it 'should not return true for objects with same numeral but different unit' do
      length1 = Measure.new "100 cm"
      length2 = Measure.new "100 mm"
      expect(Measure.equal? length1, length2).to eq(false)
    end
    it 'should not return true for objects with different numeral but same unit' do
      length1 = Measure.new "10 cm"
      length2 = Measure.new "100 cm"
      expect(Measure.equal? length1, length2).to eq(false)
    end
    it 'should be symmetric' do
      length1 = Measure.new "100 cm"
      length2 = Measure.new "100 mm"
      expect(Measure.equal? length1, length2).to eq(false)
      expect(Measure.equal? length2, length1).to eq(false)
    end
  end
end
