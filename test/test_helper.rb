ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/stub_any_instance'

Minitest::Reporters.use!

class ActiveSupport::TestCase
  fixtures :all

  MARVEL_API_FIXED_RESPONSE = [
    Hashie::Mash.new(
      name: 'MyString',
      thumbnail: { path: '/favicon', extension: 'ico' },
      comics: { items: [{ name: 'Best comic ever' }] },
      series: { items: [{ name: 'Best series ever' }] },
      events: { items: [{ name: 'Best event ever' }] },
      urls: [{ url: '' }] * 3
    )
  ].freeze
end
