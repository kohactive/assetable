FactoryGirl.define do
  factory :asset do
    name "file name"
    filename Rack::Test::UploadedFile.new(Rails.root.join("spec/files/test.jpg"), 'image/jpeg')
  end

  factory :asset_web, class: Image do
    name "File Name"
    filename Rack::Test::UploadedFile.new(Rails.root.join("spec/files/test.jpg"), 'image/jpeg')
  end
end