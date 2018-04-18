# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, :type => :model do
  it { is_expected.to respond_to(:title) }
  it { is_expected.to respond_to(:genre) }
  it { is_expected.to respond_to(:publisher) }
  it { is_expected.to respond_to(:pages) }
  it { is_expected.to respond_to(:published_at) }
  it { is_expected.to respond_to(:created_at) }
  it { is_expected.to respond_to(:updated_at) }
end