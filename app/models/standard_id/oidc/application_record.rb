module StandardId
  module Oidc
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true
    end
  end
end
