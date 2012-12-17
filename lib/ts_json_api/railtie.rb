module TsJsonApi
  class Railtie < ::Rails::Railtie
    rake_tasks do
      Dir["#{TsJsonApi.root}/lib/tasks/**/*.rake"].each { |f| load f }
    end
  end
end