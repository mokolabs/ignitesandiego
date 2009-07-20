set :application, "ignitesandiego"
set :user, "deploy"
role :web, "208.75.87.97"

namespace :deploy do
  
  desc "Push the latest changes to ignitesandiego.org"
  task :push, :roles => [:web] do 
    run "cd /home/deploy/public_html/ignitesandiego/public/ && git pull"
  end
  
end
