require 'active_record'
ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"
ActiveRecord::Migration.create_table :users do |t|
  t.string :name
  t.datetime :suspended_at
  t.timestamps :null => false
end
ActiveRecord::Base.raise_in_transactional_callbacks = true

class User < ActiveRecord::Base
end

require 'changey/dsl'
Changey::DSL.load ActiveRecord::Base
