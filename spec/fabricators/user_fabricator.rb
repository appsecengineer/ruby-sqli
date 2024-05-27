Fabricator(:user) do
  email {Faker::Internet.email}
  address {Faker::Address.full_address}
  password 'test1234'
  admin true
  after_create do |user|
    Fabricate.times(2, :to_do, user: user)
  end
end
