require 'bundler'
Bundler.require

require 'sinatra/activerecord/rake'

ActiveRecord::Base.establish_connection({
  adapter: 'postgresql',
  database: 'games_db'
})
namespace :db do
  desc "create games_db database"
  task :create_db do
    conn = PG::Connection.open()
    conn.exec('CREATE DATABASE games_db;')
    conn.close
  end
  desc "drop games_db database"
  task :drop_db do
    conn = PG::Connection.open()
    conn.exec('DROP DATABASE games_db;')
    conn.close
  end
end
