require 'ostruct'

module EtsScheduleParser
  class RecursiveStruct
    class << self
      def build(value)
        to_struct(value)
      end

      private

      def to_struct(value)
        if value.is_a?(Array)
          value.collect do |array_value|
            to_struct(array_value)
          end
        elsif value.is_a?(Hash)
          new_hash = {}
          value.each do |hash_key, hash_value|
            new_hash[hash_key] = to_struct(hash_value)
          end
          OpenStruct.new(new_hash)
        else
          value
        end
      end
    end
  end
end