# Compatibility shim for the gem's former name, standard_id-provider.
#
# `require "standard_id/provider"` keeps working. The `StandardId::Provider`
# constant alias itself lives in standard_id/oidc.rb, so it is available however
# the gem was loaded. Both are deprecated: use `require "standard_id/oidc"` and
# `StandardId::Oidc`. This shim will be removed in a future minor release.
warn "[standard_id-oidc] `require \"standard_id/provider\"` is deprecated; " \
     "use `require \"standard_id/oidc\"` instead.", uplevel: 1, category: :deprecated

require "standard_id/oidc"
