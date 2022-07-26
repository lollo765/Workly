require "spec_helper"
require "factories/user.rb"
RSpec.describe User, type: :model do
  it { is_expected.to be_mongoid_document }
end