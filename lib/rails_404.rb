module Rails404
  class Middleware
    def initialize app
      @app = app
    end

    def call env
      if @app.(env).first > 400
        ApplicationController.action('rails_404').(env)
      else
        @app.(env)
      end
    end
  end

  class Railtie < Rails::Railtie
    initializer "rails_404.insert_middleware" do |app|
      app.config.middleware.use "Rails404::Middleware"
    end
  end
end
