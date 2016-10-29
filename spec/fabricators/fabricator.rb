Fabricator(:user) do
  name { Faker::Name.name }
  email { Faker::Internet.email }
  password { "pass" }
  password_confirmation { "pass" }
  role 0
end

Fabricator(:category) do
  name { Faker::Hipster.word }
end

Fabricator(:idea) do
  name { Faker::Superhero.name }
  user
  category
  after_build do |idea|
    3.times { Fabricate(:ideas_image, :idea => idea, :image => Fabricate(:image)) }
  end
end

Fabricator(:ideas_image) do
end

Fabricator(:image) do
  url { Faker::Avatar.image }
end
