Fabricator(:to_do) do
  name {Faker::Lorem.word}
  remarks {Faker::GreekPhilosophers.quote}
  date_to_be_completed {Faker::Date.forward(days: 20)}
end
