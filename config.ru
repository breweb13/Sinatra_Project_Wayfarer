
require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end


use Rack::MethodOverride #app will know how to handle patch and delete request

use UsersController
use PostsController


run ApplicationController