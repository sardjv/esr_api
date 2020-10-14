# Fix for this bug: https://github.com/rails/rails/issues/40332

module ActiveSupport
  class EventedFileUpdateChecker
    private
      def boot!
        Listen.to(*@dtw, force_polling: true, &method(:changed)).start
      end
  end
end
