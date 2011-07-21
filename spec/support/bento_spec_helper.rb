RSpec::Matchers.define :be_invalid_without do |attribute|
  match do |record|
    record.valid?
    record.errors.include?(attribute.to_sym)
  end
end

RSpec::Matchers.define :have_user_accessors do
  match do |record|
    [record.respond_to?(:first_name),
    record.respond_to?(:last_name),
    record.respond_to?(:email),
    record.respond_to?(:password),
    record.respond_to?(:password_confirmation)].all?
  end
end