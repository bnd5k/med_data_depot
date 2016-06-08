require 'active_support/core_ext/object/blank'

module MedDataDepot
  module Constraints
    class APIVersion

      def initialize(version)
        @version = version
      end

      def matches?(request)
        accept = request.headers['Accept']
        requested_version = request.headers['X-API-Version'].to_i

        versioned_accept_header?(accept, requested_version) || 
          version_one?(accept, requested_version)
      end

      private

      attr_reader :version

      def versioned_accept_header?(accept, requested_version)
        accept && accept[/application\/vnd\.api\+json/] &&
          requested_version == version
      end

      def unversioned_accept_header?(accept, requested_version)
        accept.blank? || accept[/application\/vnd\+json/].nil?
      end

      def version_one?(accept, requested_version)
        version == 1 && unversioned_accept_header?(accept, requested_version)
      end

    end
  end
end
