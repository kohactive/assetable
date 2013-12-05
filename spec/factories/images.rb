FactoryGirl.define do
  factory :image do
    filename Rack::Test::UploadedFile.new(Rails.root.join("spec/files/test.jpg"), 'image/jpeg')
  end

  factory :image_web, class: Image do
    name "File Name"
    file Rack::Test::UploadedFile.new(Rails.root.join("spec/files/test.jpg"), 'image/jpeg')
  end
end