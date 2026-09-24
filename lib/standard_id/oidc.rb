require "standard_id"

require "standard_id/oidc/version"
require "standard_id/oidc/config/schema"
require "standard_id/oidc/id_token_service"
require "standard_id/oidc/extensions/token_grant_flow_ext"
require "standard_id/oidc/extensions/authorization_flow_ext"
require "standard_id/oidc/extensions/traditional_code_grant_ext"
require "standard_id/oidc/extensions/authorization_code_flow_ext"
require "standard_id/oidc/extensions/introspections_controller_ext"
require "standard_id/oidc/engine"

module StandardId
  module Oidc
  end

  # Former name (the gem was standard_id-provider). Kept so existing host code
  # (`StandardId::Provider::Engine` in routes, `StandardId::Provider::ConsentGrant`)
  # keeps loading; deprecated, and removed in a future minor release.
  Provider = Oidc
  deprecate_constant :Provider
end
