module ActionDispatch::Routing
  class Mapper
    def bento_for(*resources)
      resources.map!(&:to_sym)
      resources.each do |resource|
        Bento.define_helpers(resource)
      end
    end
  end
end
