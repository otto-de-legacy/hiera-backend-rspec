# Class: Hiera::Backend::Rspec_backend
# ====================================
class Hiera
  # Backend in Hiera
  module Backend
    # Rspec backend to use let(:hiera_data) in specs
    class Rspec_backend
      def lookup(key, _, _, _)
        answer = nil
        if Thread.current[:rspec_hiera_data]
          answer = Thread.current[:rspec_hiera_data][key]
        end
        answer
      end
    end
  end
end
