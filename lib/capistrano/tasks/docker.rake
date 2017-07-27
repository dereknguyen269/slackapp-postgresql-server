namespace :docker do

  desc "docker build"
  task :build do
    on roles(:app) do
      execute "cd #{current_path} && docker build --build-arg DB_USER=#{ENV['DB_USER']} --build-arg DB_PASS=#{ENV['DB_PASS']} --tag #{ENV['IMAGE_TAG']} --rm ."
    end
  end

  desc "Remove old container"
  task :remove do
    on roles(:app) do
      execute "cd #{current_path} && docker stop #{fetch(:application)}_#{fetch(:stage)} && docker rm #{fetch(:application)}_#{fetch(:stage)}"
    end
  end

  desc "docker start postgres server"
  task :start do
    on roles(:app) do
      execute "cd #{current_path} && docker run -d -p #{ENV['PORT']} --name #{fetch(:application)}_#{fetch(:stage)} -d #{ENV['IMAGE_TAG']}"
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
      execute "cd #{current_path} && docker run --rm -t -i --link #{fetch(:application)}_#{fetch(:stage)}:pg #{ENV['IMAGE_TAG']} bash"
    end
  end

end
