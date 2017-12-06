require "spec_helper"
# https://semver.org/

RSpec.describe Semvering do
  it "has a version number" do
    expect(Semvering::VERSION).not_to be nil
  end

  context "#new" do
    it "take the form X.Y.Z" do
      ver = Semvering.new 1, 1, 1
      expect(ver.class).to eq(Semvering)
    end

    it "raise ArgumentError when X, Y, Z are negative integers" do
      expect{ Semvering.new(-1, 0, 0)}.to raise_error(ArgumentError)
      expect{ Semvering.new(0, -1, 0)}.to raise_error(ArgumentError)
      expect{ Semvering.new(0, 0, -1)}.to raise_error(ArgumentError)
    end
  end

  context "comparision" do
    describe ">" do
      it "compares the major number" do
        ver1 = Semvering.new 1, 0, 0
        ver2 = Semvering.new 2, 0, 0
        expect( ver2 > ver1 ).to be true
      end

      it "compares the minor number" do
        ver1 = Semvering.new 1, 1, 0
        ver2 = Semvering.new 1, 2, 0
        expect( ver2 > ver1 ).to be true
      end

      it "compares the patch number" do
        ver1 = Semvering.new 1, 0, 1
        ver2 = Semvering.new 1, 0, 2
        expect( ver2 > ver1 ).to be true
      end
    end

    describe "<" do
      it "compares the major number" do
        ver1 = Semvering.new 1, 0, 0
        ver2 = Semvering.new 2, 0, 0
        expect( ver1 < ver2 ).to be true
      end

      it "compares the minor number" do
        ver1 = Semvering.new 1, 1, 0
        ver2 = Semvering.new 1, 2, 0
        expect( ver1 < ver2 ).to be true
      end

      it "compares the patch number" do
        ver1 = Semvering.new 1, 0, 1
        ver2 = Semvering.new 1, 0, 2
        expect( ver1 < ver2 ).to be true
      end
    end

    describe "==" do
      it "compares all numbers" do
        ver1 = Semvering.new 1, 0, 0
        ver2 = Semvering.new 1, 0, 0
        expect( ver1 == ver2 ).to be true
      end
    end

    describe "!=" do
      it "compares all properties" do
        ver1 = Semvering.new 1, 0, 0
        expect( ver1 != ver1 ).to be false
      end
    end

  end
end
