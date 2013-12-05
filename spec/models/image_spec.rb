require 'spec_helper'

describe Image do

  context "when saved" do
    before :each do
      @image = FactoryGirl.build(:image)
    end

    it "should have a filename" do
      @image.filename.should_not be_nil
    end
  end

end