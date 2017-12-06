require "spec_helper"

RSpec.describe Semvering do
  it "has a version number" do
    expect(Semvering::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
