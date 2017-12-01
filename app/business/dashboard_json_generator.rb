class DashboardJsonGenerator
  def initialize(opts={})
    @user_repository     = opts.delete(:user_repository) { ::User }
    @question_repository = opts.delete(:question_repository) { ::Question }
    @answer_repository   = opts.delete(:answer_repository) { ::Answer }
    @tenant_repository   = opts.delete(:tenant_repository) { ::Tenant }
  end

  def self.generate(*attr)
    new(*attr).generate
  end

  def generate
    {
      users: user_repository.all.count,
      questions: question_repository.all.count,
      answers: answer_repository.all.count,
      tenants: tenants
    }
  end

  private

  def tenants
    [].tap do |result|
      tenant_repository.all.each do |tenant|
        result << {
          name: tenant.name,
          login: tenant.login,
          requests: tenant_requests(tenant)
        }
      end
    end
  end

  def tenant_requests(tenant)
    [].tap do |result|
      tenant.tenant_requests.each do |tenant_request|
        result << {
          route: tenant_request.route,
          amout: tenant_request.amount,
          created_at: tenant_request.created_at
        }
      end
    end
  end

  attr_reader :user_repository, :question_repository, :answer_repository, :tenant_repository
end
