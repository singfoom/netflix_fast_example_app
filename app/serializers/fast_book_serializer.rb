class FastBookSerializer
  include FastJsonapi::ObjectSerializer
  set_type :book
  set_id :id
  attributes :created_at,
             :genre,
             :publisher,
             :published_at,
             :title,
             :updated_at
end