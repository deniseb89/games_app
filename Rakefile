require 'bundler'
Bundler.require

require 'sinatra/activerecord/rake'

ActiveRecord::Base.establish_connection({
  adapter: 'postgresql',
  database: 'tictactoe_db'
})
namespace :db do
  desc "create tictactoe_db database"
  task :create_db do
    conn = PG::Connection.open()
    conn.exec('CREATE DATABASE tictactoe_db;')
    conn.close
  end
  desc "drop tictactoe_db database"
  task :drop_db do
    conn = PG::Connection.open()
    conn.exec('DROP DATABASE tictactoe_db;')
    conn.close
  end
end
