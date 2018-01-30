require 'test_helper'

class Resolvers::CreateLinkTest < ActiveSupport::TestCase
  def perform(args = {})
    Resolvers::CreateLink.new.call(nil, args, {})
  end

  test 'creating new link' do
    link = perform(
      url: 'http://example.com',
      description: 'a website',
    )

    assert link.persisted?
    assert_equal 'a website', link.description
    assert_equal 'http://example.com', link.url
  end
end
