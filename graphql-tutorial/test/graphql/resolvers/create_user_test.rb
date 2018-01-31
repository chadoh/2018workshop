require 'test_helper'

class Resolvers::CreateUserTest < ActiveSupport::TestCase
  def perform(args = {})
    Resolvers::CreateUser.new.call(nil, args, {})
  end

  test 'creating new user' do
    user = perform(
      name: "Chad Ostrowski",
      authProvider: {
        email: {
          email: "hello@example.com",
          password: "bubbles",
        }
      }
    )

    assert user.persisted?
    assert_equal 'Chad Ostrowski', user.name
    assert_equal 'hello@example.com', user.email
  end
end
