module MedDataDepot
  module Guideline
    class List

      def initialize(guideline_model)
        @guideline_model = guideline_model
      end

      def call
        guideline_model.all
      end

      private

      attr_reader :guideline_model

    end
  end
end
