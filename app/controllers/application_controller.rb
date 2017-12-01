class ApplicationController < ActionController::API
  before_action :check_valid_api_key, :register_tenant

  protected

  def status_identifyer(collection)
    collection.blank? ? 204 : 200
  end

  private

  def check_valid_api_key
    @tenant = Tenant.find_by_api_key(request.headers['HTTP_API_KEY'])

    render status: 412,
      json: {
        message: I18n.t('controllers.application_controller.tenant_not_registered')
      } if @tenant.blank?
  end

  def register_tenant
    route     = request.path
    tenant_id = @tenant.id

    tenant_request = TenantRequest.by_route(route).by_tenant(tenant_id).created_today.first

    if tenant_request.present?
      tenant_request.amount += 1
      tenant_request.save!
    else
      TenantRequest.create(route: route, tenant_id: @tenant.id, amount: 1)
    end
  end
end
