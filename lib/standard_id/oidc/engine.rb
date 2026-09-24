module StandardId
  module Oidc
    class Engine < ::Rails::Engine
      isolate_namespace StandardId::Oidc

      initializer "standard_id_oidc.extend_core" do
        StandardId::Oauth::TokenGrantFlow.prepend(
          StandardId::Oidc::Extensions::TokenGrantFlowExt
        )

        StandardId::Oauth::AuthorizationCodeAuthorizationFlow.prepend(
          StandardId::Oidc::Extensions::AuthorizationFlowExt
        )

        StandardId::Oauth::Subflows::TraditionalCodeGrant.prepend(
          StandardId::Oidc::Extensions::TraditionalCodeGrantExt
        )

        StandardId::Oauth::AuthorizationCodeFlow.prepend(
          StandardId::Oidc::Extensions::AuthorizationCodeFlowExt
        )
      end

      # Controllers are reloadable, so this cannot live in the initializer
      # above: referencing the constant there would pin the boot-time class and
      # every `reload!` in development would drop the extension. `to_prepare`
      # runs on each reload, and `prepend` of an already-prepended module is a
      # no-op, so re-running it is free.
      config.to_prepare do
        StandardId::Api::Oauth::IntrospectionsController.prepend(
          StandardId::Oidc::Extensions::IntrospectionsControllerExt
        )
      end
    end
  end
end
