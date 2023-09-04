namespace :db do
  desc "Drop, create, load schema then seed the development database"
  task reseed: ["db:drop", "db:create", "db:schema:load", "db:seed"] do
    puts "Reseeding completed."
  end
end
