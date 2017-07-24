namespace :docker do

  desc "docker build"
  task :build do
    on roles(:app) do
      execute "cd #{current_path} && docker build -t eg_postgresql ."
    end
  end

  desc "docker start postgres server"
  task :start do
    on roles(:app) do
      execute "cd #{current_path} && docker run -d -P --name #{fetch(:application)}_#{fetch(:stage)} eg_postgresql"
    end
  end

  desc "docker stop postgres server"
  task :stop do
    on roles(:app) do
      execute "cd #{current_path} && docker stop #{fetch(:application)}_#{fetch(:stage)}"
    end
  end

  desc "docker ps"
  task :ps do
    on roles(:app) do
      execute "cd #{current_path} && docker ps"
    end
  end

  desc "docker access postgres server"
  task :postgres do
    on roles(:app) do
      execute "cd #{current_path} && docker run --rm -t -i --link #{fetch(:application)}_#{fetch(:stage)}:pg eg_postgresql bash"
    end
  end

end
