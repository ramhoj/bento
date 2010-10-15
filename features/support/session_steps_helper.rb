module SessionStepsHelper
  attr_accessor :current_user

  def sign_in(user=User.make)
    visit('/')
    click_link('Sign in')
    fill_in('Email', :with => user.email)
    fill_in('Password', :with => 'test1234')
    click_button('Sign in')
    @current_user = user
  end
end

World(SessionStepsHelper)