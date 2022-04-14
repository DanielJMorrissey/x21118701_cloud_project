require 'rails_helper'
require 'spec_helper'

RSpec.describe Band, :type=> :model do
  subject {
    described_class.new(name: "dan the man", country: "Ireland", members: 1, genre: "rock")
  }

  # testing database insertion with 2 non mandatory inputs empty
  it "is valid with country and members attributes empty" do
    subject.country = nil
    subject.members = nil
    expect(subject).to be_valid
  end

  # testing database insertion will all inputs filled in
  it "is valid with all attributes filled in" do
    expect(subject).to be_valid
  end

  # testing database not inserting data with name input empty
  it "is not valid with name attribute empty" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  # testing database not inserting data with genre input empty
  it "is not valid with genre attribute empty" do
    subject.genre = nil
    expect(subject).to_not be_valid
  end

  # testing database not inserting data with name and genre inputs empty
  it "is not valid with name and genre attributes empty" do
    subject.name = nil
    subject.genre = nil
    expect(subject).to_not be_valid
  end

  # testing database inserting data with only country input empty
  it "is valid with country attribute empty" do
    subject.country = nil
    expect(subject).to be_valid
  end

  # testing database inserting data with only members input empty
  it "is valid with members attribute empty" do
    subject.members = nil
    expect(subject).to be_valid
  end
end
