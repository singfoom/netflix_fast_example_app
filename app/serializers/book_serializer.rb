# frozen_string_literal: true

class BookSerializer < ActiveModel::Serializer
  attributes :created_at,
             :genre,
             :publisher,
             :published_at,
             :title,
             :updated_at
end