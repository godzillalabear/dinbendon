# categories.rb

FactoryBot.define do
  factory :category do
    name {Faker::Name.name}
  end
end


# c1 = FactoryBot.create(:category)
# puts c1.name  => "Category 123"