require 'spec_helper'

describe 'Unit' do
  it 'should create unit object ' do
    expect(Unit::CM.unit).to eq("cm")
    expect(Unit::CM2.unit).to eq("cm2")
    expect(Unit::MM.unit).to eq("mm")
    expect(Unit::MM2.unit).to eq("mm2")
    expect(Unit::M.unit).to eq("m")
    expect(Unit::M2.unit).to eq("m2")
  end

  describe 'to_square'do
    it 'should return unit with square dimension' do
      expect(Unit::MM.to_square == Unit::MM2).to eq(true)
      expect(Unit::CM.to_square == Unit::CM2).to eq(true)
      expect(Unit::M.to_square == Unit::M2).to eq(true)
    end
  end
end
