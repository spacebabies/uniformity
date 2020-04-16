module Uniformity
  class EngineGenerator < ::Rails::Generators::NamedBase
    source_root File.expand_path('templates', __dir__)

    def add_engine_files
      directory "engine_root", "engines/#{application_name}-#{singular_name}"
      template "initializer.rb", "config/initializers/#{application_name}_#{singular_name}.rb"
    end

    def bundle_engine
      gem "#{application_name}-#{singular_name}", path: "engines/#{application_name}-#{singular_name}"
      run "bundle install"
    end

    def mount_engine
      route "mount #{application_const_base}::#{class_name}.engine, at: '#{singular_name}'"
    end

    private

    def application_const_base
      if defined?(Rails) && Rails.application
        Rails.application.class.name.split("::").first
      end
    end
  end
end
