class ChangeTenantColumnApiTokenToApiKey < ActiveRecord::Migration[5.1]
  def change
    rename_column :tenants, :api_token, :api_key
  end
end
