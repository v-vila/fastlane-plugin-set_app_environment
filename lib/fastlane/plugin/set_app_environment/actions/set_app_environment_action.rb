module Fastlane
  module Actions
    class SetAppEnvironmentAction < Action
      def self.run(params)
        if !params[:env]
          raise "Environment not provided"
        end
        sh("jq '{ \"#{params[:env]}\": .#{params[:env]} }' #{params[:env_file_path]} > environments.tmp.json && mv environments.tmp.json #{params[:env_file_path]}")
      end

      def self.description
        "Set app environment"
      end

      def self.authors
        ["Your Name"]
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :env,
                                       description: "Environment",
                                       optional: false),
          FastlaneCore::ConfigItem.new(key: :env_file_path,
                                       description: "Path to environment file",
                                       optional: false)
        ]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end