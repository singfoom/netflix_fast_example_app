# frozen_string_literal: true

FactoryBot.define do

  sequence(:title) { |n| "#{Faker::Book.title}" }
  sequence(:publisher) { |n| "#{Faker::Book.publisher}" }
  sequence(:genre) { |n| "#{Faker::Book.genre}" }

  factory :book do
    title { generate(:title) }
    publisher { generate(:publisher) }
    genre { generate(:genre) }
    published_at 3.days.ago
  end

end