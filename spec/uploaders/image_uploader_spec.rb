describe ImageUploader do

  context 'an image uploader' do
    before :all do
      @uploader = ImageUploader.new
    end

    it 'should upload the image' do
      result = @uploader.store!(File.open(File.expand_path("spec/files/test.jpg")))
      result.should_not be_nil
    end
    
    it 'should create a version of the image for each version of the file' do
      @uploader.store!(File.open(File.expand_path("spec/files/test.jpg")))
      @uploader.versions.length.should eq(ImageUploader.versions.keys.length)
    end
  end

end