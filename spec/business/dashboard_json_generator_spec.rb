require 'spec_helper'
require 'app/business/dashboard_json_generator'

describe DashboardJsonGenerator do
  let(:tenant1) { double(:tenant1, name: 'Alex', login: 'alex') }
  let(:tenant2) { double(:tenant2, name: 'Cassandra', login: 'cassandra') }
  let(:date_time) { Time.now }

  let(:user_repository) { double(:user_repository) }
  let(:question_repository) { double(:question_repository) }
  let(:answer_repository) { double(:answer_repository) }
  let(:tenant_repository) { double(:tenant_repository) }

  let(:tenant_request1) do
    double(
      :tenant_request1,
      route: '/questions',
      amount: 2,
      created_at: date_time
    )
  end

  let(:tenant_request2) do
    double(
      :tenant_request2,
      route: '/users',
      amount: 1,
      created_at: date_time
    )
  end

  subject do
    described_class.new(
      user_repository: user_repository,
      question_repository: question_repository,
      answer_repository: answer_repository,
      tenant_repository: tenant_repository
    )
  end


  it 'should generate' do
    allow(user_repository).to receive(:all).and_return(user_repository)
    allow(user_repository).to receive(:count).and_return(3)

    allow(question_repository).to receive(:all).and_return(question_repository)
    allow(question_repository).to receive(:count).and_return(2)

    allow(answer_repository).to receive(:all).and_return(answer_repository)
    allow(answer_repository).to receive(:count).and_return(1)

    allow(tenant_repository).to receive(:all).and_return([tenant1, tenant2])

    tenant1.should_receive(:tenant_requests).and_return([tenant_request1])
    tenant2.should_receive(:tenant_requests).and_return([tenant_request2])

    result = {
      users: 3,
      questions: 2,
      answers: 1,
      tenants:
        [
          {
            name: 'Alex',
            login: 'alex',
            requests: [ { route: '/questions', amout: 2, created_at: date_time } ]
          },
          {
            name: 'Cassandra',
            login: 'cassandra',
            requests: [ { route: '/users', amout: 1, created_at: date_time } ]
          }
        ]
    }

    expect(subject.generate).to eq result
  end
end
