module ContextualExceptions
  module ContextualError
    def with_context(message, e)
      new_e = new(message << ": #{e.message}")
      new_e.set_backtrace e.backtrace
      new_e
    end
  end
end