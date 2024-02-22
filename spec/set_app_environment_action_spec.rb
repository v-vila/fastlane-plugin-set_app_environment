describe Fastlane::Actions::SetAppEnvironmentAction do
  describe '#run' do
    it 'raises an error if environment is not provided' do
      expect do
        Fastlane::Actions::SetAppEnvironmentAction.run(env: nil, env_file_path: "path/to/env_file")
      end.to raise_error("Environment not provided")
    end
  end
end
