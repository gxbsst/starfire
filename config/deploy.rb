require "bundler/capistrano"

set :application, "sftires.com.cn"

set :repository,  "git://github.com/gxbsst/starfire.git"
set :deploy_to, "/srv/rails/statfire_deploy"

if ENV['RAILS_ENV'] =='production'
  require "rvm/capistrano"
  server "jh_web3", :web, :app, :db, primary: true
  set :user, "root"
elsif ENV['RAILS_ENV'] =='jh_web3'
  set :default_environment, {
      'PATH' => "/home/deployer/.rbenv/versions/1.9.3-p448/bin/:$PATH"
  }
  server "jh_web3", :web, :app, :db, primary: true
  set :branch, "master"
  # set :repository,  "git@git.sidways.com:ruby/outsourcing/cooper"
  set :user, "deployer"
  set :deploy_to, "/home/#{user}/apps/#{application}"
  # set :deploy_to, "/srv/rails/cooper-sem"

  # server "192.168.11.31", :web, :app, :db, primary: true
  # set :user, "rails"
end

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

# role :web, "aries.sidways.lab"                          # Your HTTP server, Apache/etc
# role :app, "aries.sidways.lab"                          # This may be the same as your `Web` server
# role :db,  "aries.sidways.lab", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

set :use_sudo, false

set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases


# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  task :setup_config, roles: :app do
    # sudo "ln -nfs #{current_path}/config/apache.conf /etc/apache2/sites-available/#{application}"
    run "mkdir -p #{shared_path}/config"
    put File.read("config/database.yml.mysql"), "#{shared_path}/config/database.yml"
    puts "Now edit the config files in #{shared_path}."

  end

  after "deploy:setup", "deploy:setup_config"

  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
#   run "ln -nfs #{shared_path}/config/database.yml  /srv/rails/cooper/releases/20121205032322/config/database.yml"
  end
  after "deploy:finalize_update", "deploy:symlink_config"

  task :bundle_install do
    run("cd #{deploy_to}/current; bundle install --path=vendor/gems")
  end

  task :migration do
    run("cd #{deploy_to}/current; rake db:migrate ")
  end

  task :change_tmp do
    # run("chmod -R 777 #{current_path}/tmp")
    puts "====chmod -R 777 tmp & chmod -R 777 public====="
  end
  after "deploy:finalize_update", "deploy:change_tmp"

  task :mv_static_page do 
    # run("mv #{release_path}/public/index.html #{release_path}/public/index.html_bak")
    #run("mv #{release_path}/public/news.html #{release_path}/public/news.html_bak")
    #run("mv #{release_path}/public/sitemap.html #{release_path}/public/sitemap.html_bak")
    #run("mv #{release_path}/public/copyright.html #{release_path}/public/copyright.html_bak")
  end
  after "deploy:finalize_update", "deploy:mv_static_page"


end


# 设置数据库
# namespace :deploy do
#   task :config_database do
#     run "#{try_sudo} cp #{File.join(current_path,'config','database.yml.mysql')}  #{File.join(current_path,'config','database.yml')}"
#   end
# end
 
