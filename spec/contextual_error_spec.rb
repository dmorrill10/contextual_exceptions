
require_relative 'support/spec_helper'

require 'contextual_exceptions/contextual_error'

include ContextualExceptions

SubjectError = Class.new(StandardError)
SubjectError.extend ContextualError

describe ContextualError do
  it '::with_context should work' do
    local_message = 'local message'
    full_context = nil
    begin
      raise
    rescue => full_context
    end
    patient = SubjectError.with_context(local_message, full_context)

    patient.message.must_equal(local_message << ": #{full_context.message}")
    patient.backtrace.must_equal full_context.backtrace
  end
end
