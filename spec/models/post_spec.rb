# This is just a test model. It exists in the dummy app

require 'spec_helper'

describe Post do

  it { should have_one(:image_association) }
  it { should have_one(:image).through(:image_association) }
  
  context "That is created with an image" do
    before :each do
      @post = FactoryGirl.build(:post)
    end

    it "should have an image" do
      @post.image.should_not be_nil
      @post.image.should be_valid
    end
  end

end
