RSpec.describe Handling::UserRepository, '#work' do
  let(:filename) { 'data' }
  let(:path_actual_txt_file) { "spec/fixtures/#{filename}.txt" }
  let(:path_expected_json_file) { "spec/fixtures/expected_files/report_from_#{filename}.json" }
  let(:expected_json_file) { File.read(path_expected_json_file) }

  context 'when is default file' do
    before do
      described_class
        .new(path_actual_txt_file)
        .work('spec/fixtures/tmp')
    end

    it 'results are equivalent' do
      generated_json = JSON.parse(File.read(path_expected_json_file))

      expect(generated_json).to eq(JSON.parse(expected_json_file))
    end
  end
end
