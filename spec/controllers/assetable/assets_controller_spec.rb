require 'spec_helper'

describe Assetable::AssetsController do

  render_views

  describe "POST #create" do
    
    context "JS" do
      it "should respond with JS" do
        @image = FactoryGirl.attributes_for(:image_web)
        xhr :post, :create, @image
        response.should be_success
      end

      context "uploading a document" do
        before :each do
          @document = FactoryGirl.attributes_for(:document_web)
        end
        
        it "should respond with success" do
          xhr :post, :create, @document
          response.should be_success
        end
      end
    end
    
  end

end