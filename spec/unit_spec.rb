require 'spec_helper'

describe 'Unit' do
  it 'should create unit object ' do
    expect(Unit::CM.unit).to eq("cm")
    expect(Unit::CM.conversion_factor).to eq(10)
    expect(Unit::CM2.unit).to eq("cm2")
    expect(Unit::CM2.conversion_factor).to eq(100)
    expect(Unit::MM.unit).to eq("mm")
    expect(Unit::MM.conversion_factor).to eq(1)
    expect(Unit::MM2.unit).to eq("mm2")
    expect(Unit::MM2.conversion_factor).to eq(1)
    expect(Unit::M.unit).to eq("m")
    expect(Unit::M.conversion_factor).to eq(1000)
    expect(Unit::M2.unit).to eq("m2")
    expect(Unit::M2.conversion_factor).to eq(1000000)
  end

  describe 'to_square'do
    it 'should return unit with square dimension' do
      expect(Unit::MM.to_square == Unit::MM2).to eq(true)
      expect(Unit::CM.to_square == Unit::CM2).to eq(true)
      expect(Unit::M.to_square == Unit::M2).to eq(true)
    end
  end

  describe 'to_mm' do
    it 'should convert any unit into mm' do
      number = 5
      expect(Unit::MM.to_mm number).to eq(5)
      expect(Unit::CM.to_mm number).to eq(50)
      expect(Unit::M.to_mm number).to eq(5000)
    end
  end
end
