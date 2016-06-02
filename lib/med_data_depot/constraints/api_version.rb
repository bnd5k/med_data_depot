require 'active_support/core_ext/object/blank'

module MedDataDepot
  module Constraints
    class APIVersion

      def initialize(version)
        @version = version
      end

      def matches?(request)
        versioned_accept_header?(request) || version_one?(request)
      end

      private

      attr_reader :version

      def versioned_accept_header?(request)
        accept = request.headers['Accept']
        accept && accept[/application\/vnd\.med-data-depot-v#{@version}\+json/]
      end

      def unversioned_accept_header?(request)
        accept = request.headers['Accept']
        accept.blank? || accept[/application\/vnd\.med-data-depot/].nil?
      end

      def version_one?(request)
        version == 1 && unversioned_accept_header?(request)
      end

    end
  end
end
