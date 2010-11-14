module ActionDispatch::Routing
  class Mapper
    def bento_for(*resource_names, &block)
      resource_names.map!(&:to_sym)
      resource_names.each do |resource_name|
        Bento::Controllers::Helpers.define_helpers(resource_name)

        resources(resource_name, :controller => account_controller(resource_name)) do
          collection { get :sign_up }
          yield if block_given?
        end
      end
    end

    protected

    def account_controller(resource_name)
      if resource_name == :accounts and not overridden_accounts_contoller? then "bento/accounts" else nil end
    end

    def overridden_accounts_contoller?
      File.exist?(Rails.root.join("app", "controllers", "accounts_controller.rb"))
    end
  end
end
