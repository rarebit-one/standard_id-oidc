require "rails_helper"

# The gem was renamed from standard_id-provider. Host code written against the
# old name must keep loading for a deprecation window.
RSpec.describe "standard_id-provider compatibility shim" do
  it "aliases StandardId::Provider to StandardId::Oidc" do
    expect(StandardId.const_get(:Provider)).to equal(StandardId::Oidc)
  end

  it "resolves the old engine and model constants hosts reference" do
    expect(StandardId.const_get(:Provider)::Engine).to equal(StandardId::Oidc::Engine)
    expect(StandardId.const_get(:Provider)::ConsentGrant).to equal(StandardId::Oidc::ConsentGrant)
  end

  it "keeps `require \"standard_id/provider\"` working, with a deprecation warning" do
    shim = File.expand_path("../../lib/standard_id/provider.rb", __dir__)
    previous = Warning[:deprecated]
    Warning[:deprecated] = true
    expect { load shim }.to output(/standard_id\/provider.*deprecated/).to_stderr
  ensure
    Warning[:deprecated] = previous
  end
end
