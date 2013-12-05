require 'spec_helper'

describe Assetable::AssetsController do

  describe "POST #create" do
    
    context "JSON" do
      it "should respond with JSON" do
        @image = FactoryGirl.attributes_for(:image_web)
        post :create, @image
        response.should be_success
      end

      context "uploading a document" do
        before :each do
          @document = FactoryGirl.attributes_for(:document_web)
        end
        
        it "should respond with success" do
          post :create, @document
          response.should be_success
        end
      end
    end
    
  end

end