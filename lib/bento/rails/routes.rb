module ActionDispatch::Routing
  class Mapper
    def bento_for(*resources)
      resources.map!(&:to_sym)
      resources.each do |resource|
        Bento::Controllers::Helpers.define_helpers(resource)
      end
    end
  end
end
