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
  end

end