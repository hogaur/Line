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

  describe'conversion' do
    describe 'to_mm' do
      it 'should convert cm to mm' do
        expect(Unit::CM.to_mm.numeral == 10.0).to eq(true)
        expect(Unit::CM.to_mm.unit == Unit::MM).to eq(true)
      end

      it 'should convert m to mm' do
        expect(Unit::M.to_mm.numeral == 1000.0).to eq(true)
        expect(Unit::M.to_mm.unit == Unit::MM).to eq(true)
      end

      it 'should return 1 mm for mm unit' do
        expect(Unit::MM.to_mm.numeral == 1.0).to eq(true)
        expect(Unit::MM.to_mm.unit == Unit::MM).to eq(true)
      end
    end
  end

  describe 'Multiplication' do
    it 'should return multiplication of two unit objects' do
      expect((Unit.multiply Unit::MM, Unit::MM).numeral).to eq(1.0)
      expect((Unit.multiply Unit::MM, Unit::MM).unit == Unit::MM2).to eq(true)
      expect((Unit.multiply Unit::MM, Unit::CM).numeral).to eq(10.0)
      expect((Unit.multiply Unit::MM, Unit::CM).unit == Unit::MM2).to eq(true)
      expect((Unit.multiply Unit::M, Unit::M).numeral).to eq(1.0)
      expect((Unit.multiply Unit::M, Unit::M).unit == Unit::M2).to eq(true)
    end
  end

  describe 'to_square'do
    it 'should return unit with square dimension' do
      expect(Unit::MM.to_square == Unit::MM2).to eq(true)
      expect(Unit::CM.to_square == Unit::CM2).to eq(true)
      expect(Unit::M.to_square == Unit::M2).to eq(true)
    end
  end

  describe 'Addition' do
    it 'should return the addition of two unit objects' do
      expect((Unit.add Unit::MM, Unit::MM).numeral).to eq(1.0)
      expect((Unit.add Unit::MM, Unit::MM).unit ==  Unit::MM).to eq(true)
      expect((Unit.add Unit::MM, Unit::CM).numeral).to eq(11.0)
      expect((Unit.add Unit::MM, Unit::CM).unit == Unit::MM).to eq(true)
      expect((Unit.add Unit::M, Unit::M).numeral).to eq(1.0)
      expect((Unit.add Unit::M, Unit::M).unit == Unit::M).to eq(true)
    end
  end
end
