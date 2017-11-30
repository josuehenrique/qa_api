require 'rails_helper'

describe Answer do
  it { should belong_to(:provider).class_name('User') }
  it { should belong_to :question }

  it { should validate_presence_of(:answer) }
  it { should validate_presence_of(:provider_id) }
end
