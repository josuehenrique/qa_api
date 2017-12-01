require 'rails_helper'

describe Tenant do
  it { should validate_presence_of :name }
  it { should validate_presence_of :login }
  it { should validate_presence_of :api_key }
end
