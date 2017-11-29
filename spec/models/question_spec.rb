require 'rails_helper'

describe Question do
  it { should belong_to(:asker).class_name('User') }

  it { should validate_presence_of(:asker_id) }
  it { should validate_presence_of(:question) }
end
