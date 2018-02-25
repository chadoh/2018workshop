require 'test_helper'

class Resolvers::CreateLinkTest < ActiveSupport::TestCase
  def perform(user: nil, **args)
    Resolvers::CreateLink.new.call(nil, args, current_user: user)
  end

  test 'creating new link' do
    user = User.create(name: "Hai Thair", email: "hai@example.com")

    link = perform(
      url: 'http://example.com',
      description: 'a website',
      user: user,
    )

    assert link.persisted?
    assert_equal 'a website', link.description
    assert_equal 'http://example.com', link.url
  end
end
