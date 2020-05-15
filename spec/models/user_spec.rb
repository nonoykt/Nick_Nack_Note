require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with an username, email, image" do

  it "is invalid without an username"

  it "is invalid without an email"

  it "is invalid with a duplicate email"

  it "is invalid without an image"
end
