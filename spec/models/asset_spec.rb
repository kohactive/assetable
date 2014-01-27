require 'spec_helper'

describe Asset do

  it { should have_many(:asset_attachments) }
  it { should have_many(:assetable).through(:asset_attachments) }

  context "that is saved" do
    before :each do
      @asset = FactoryGirl.create(:image)
    end

    it "should have a type" do
      @asset.type.should_not be_nil
    end

    it "should have a content type" do
      @asset.content_type.should_not be_nil
    end

    context "that is an image" do

      it "should have a ratio" do
        @asset.ratio.should_not be_nil
      end

      it "should have a properly calculated ratio" do
        @asset.ratio.should be_within(0.00001).of(1.33333)
      end
    end
  end

end