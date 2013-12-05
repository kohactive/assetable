FactoryGirl.define do
  factory :document do
    filename Rack::Test::UploadedFile.new(Rails.root.join("spec/files/test.pdf"), "application/pdf")
  end

  factory :document_web, class: Image do
    name "File Name"
    file Rack::Test::UploadedFile.new(Rails.root.join("spec/files/test.pdf"), "application/pdf")
  end
end