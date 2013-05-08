require 'contextual_exceptions/contextual_error'

module ContextualExceptions
  # @return This string in camel-case class name form.
  def self.string_to_camel_case(string)
    class_name = string.to_s.capitalize
    class_name.gsub(/[_\s]+./) { |match| match = match[1,].capitalize }
  end

  module ClassRefinement
    refine Class do
      # @param [Array] names A list of exception names that the calling class would
      #  like to define.
      def exceptions(*names)
        names.each do |name|
          error_name = ContextualExceptions.string_to_camel_case name
          const_set(error_name, Class.new(StandardError))
          const_get(error_name).extend ContextualError
        end
      end
    end
  end
end