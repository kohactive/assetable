require 'spec_helper'

describe Document do

  context "when saved" do
    before :each do
      @document = FactoryGirl.build(:document)
    end

    it "should have a filename" do
      @document.filename.should_not be_nil
    end
  end

end