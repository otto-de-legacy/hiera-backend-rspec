# Class: Hiera::Backend::Rspec_backend
# ====================================
class Hiera
  # Backend in Hiera
  module Backend
    # Rspec backend to use let(:hiera_data) in specs
    class Rspec_backend
      def lookup(key, _, _, _, _)
        unless (data = Thread.current[:rspec_hiera_data]) && data.include?(key)
          throw :no_such_key
        end
        data[key]
      end
    end
  end
end
