require_relative 'support/spec_helper'

require 'contextual_exceptions/class_refinement'

include ContextualExceptions
using ClassRefinement

class SubjectClass
  exceptions :subject_error
end

describe ClassRefinement do
  it '::with_context should work' do
    local_message = 'local message'
    full_context = nil
    begin
      raise
    rescue => full_context
    end
    patient = SubjectClass::SubjectError.with_context(local_message, full_context)

    patient.message.must_equal(local_message << ": #{full_context.message}")
    patient.backtrace.must_equal full_context.backtrace
  end
end
