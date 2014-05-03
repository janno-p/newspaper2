require 'spec_helper'

describe Newspaper do
  before do
    @newspaper = Newspaper.create(name: 'Postimees', founded_at: Date.civil(2014, 5, 3), founded_at_str: '03.05.2014')
  end

  it "should be valid with name and founded date set" do
    @newspaper.should be_valid
  end

  it "should not be valid without name" do
    @newspaper.name = nil
    @newspaper.should_not be_valid
    @newspaper.errors[:name].should include('Ajalehe nimi on kohustuslik märkida.')
  end

  it "should not be valid with name longer than 50" do
    @newspaper.name = 'A' * 51
    @newspaper.should_not be_valid
    @newspaper.errors[:name].should include('Ajalehe nimi võib olla maksimaalselt 50 sümbolit pikk.')
  end

  it "should not be valid without founded_at date" do
    @newspaper.founded_at = nil
    @newspaper.should_not be_valid
    @newspaper.errors[:founded_at].should include('Ajalehe esimese väljaande kuupäev on kohustuslik märkida.')
  end

  it "should not be valid without founded_at string" do
    @newspaper.founded_at_str = nil
    @newspaper.should_not be_valid
    @newspaper.errors[:founded_at_str].should include('Ajalehe esimese väljaande kuupäev on kohustuslik märkida.')
  end

  it "should not be valid when founded_at string does not have correct format" do
    @newspaper.founded_at_str = 'tere'
    @newspaper.should_not be_valid
    @newspaper.errors[:founded_at_str].should include('Ajalehe esimese väljaande kuupäev on vigasel kujul.')
  end
end
