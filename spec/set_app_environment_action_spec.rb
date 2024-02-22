describe Fastlane::Actions::SetAppEnvironmentAction do
  describe '#run' do
    it 'raises an error if environment is not provided' do
      expect do
        Fastlane::Actions::SetAppEnvironmentAction.run(env: nil, env_file_path: "path/to/env_file")
      end.to raise_error("Environment not provided")
    end

    it 'sets app environment using jq command' do
      # Stubbing sh method to prevent actual shell command execution
      allow(Fastlane::Actions).to receive(:sh)

      params = {
        env: "test_env",
        env_file_path: "path/to/env_file"
      }

      # Expecting the sh method to be called with the correct jq command
      expect(Fastlane::Actions).to receive(:sh).with("jq '{ \"test_env\": .test_env }' path/to/env_file > path/to/env_file.tmp && mv path/to/env_file.tmp path/to/env_file")

      # Calling the run method of the action
      Fastlane::Actions::SetAppEnvironmentAction.run(params)
    end
  end
end