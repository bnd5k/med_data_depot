module MedDataDepot
  module Guideline
    class FindGuideline

      def initialize(guideline_model)
        @guideline_model = guideline_model
      end

      def call(guideline_id)
        guideline_model.find_by_id(guideline_id)
      end

      private

      attr_reader :guideline_model

    end
  end
end
