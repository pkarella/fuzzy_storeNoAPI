require 'rails_helper'

describe Product do
  it { should have_many :orders}
end
