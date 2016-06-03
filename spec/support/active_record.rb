require "active_record"
require "logger"
require "fileutils"

TEST_DATABASE = File.expand_path("../../tmp/db.sqlite3", __FILE__).freeze

RSpec.configure do |config|
  config.before(:suite) do
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    ActiveRecord::Base.establish_connection(
      adapter: "sqlite3",
      database: TEST_DATABASE
    )
  end

  config.after(:suite) do
    FileUtils.rm_f(TEST_DATABASE)
  end
end

