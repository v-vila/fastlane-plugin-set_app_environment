describe Fastlane::Actions::SetAppEnvironmentAction do
  describe '#run' do
    it 'raises an error if environment is not provided' do
      expect do
        Fastlane::Actions::SetAppEnvironmentAction.run(env: nil, env_file_path: "path/to/env_file")
      end.to raise_error("Environment not provided")
    end

    it 'executes shell command to set app environment' do
      allow(Fastlane).to receive(:sh)

      params = {
        env: "test_env",
        env_file_path: "path/to/env_file"
      }

      expect(Fastlane).to receive(:sh).with("jq '{ \"test_env\": .test_env }' path/to/env_file > environments.tmp.json && mv environments.tmp.json path/to/env_file")

      Fastlane::Actions::SetAppEnvironmentAction.run(params)
    end
  end
end