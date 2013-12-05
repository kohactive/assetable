# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title "Maecenas sed diam eget risus varius blandit sit amet non magna."
    body "Nullam id dolor id nibh ultricies vehicula ut id elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae elit libero, a pharetra augue. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Maecenas faucibus mollis interdum."
    
    after(:build) do |post|
      post.image = FactoryGirl.build(:image, name: "image")
    end
  end

  factory :post_with_image, parent: :post do
    after(:build) do |post|
      post.image = FactoryGirl.build(:image, name: "image")
    end
  end
end
