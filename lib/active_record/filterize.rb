module ActiveRecord
  module Filterize
    extend ActiveSupport::Concern

    module ClassMethods
      def filterize
        scope :active, lambda { |active=true| where(active: active).ordered }
      end
    end
  end
end
