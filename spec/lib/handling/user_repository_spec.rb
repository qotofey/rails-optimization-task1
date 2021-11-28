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

  context 'with assert performance' do
    let(:filename) { 'data20000' }

    it 'works under 25s' do
      expect do
        described_class.new(path_actual_txt_file).work('spec/fixtures/tmp')
      end.to perform_under(25).sec.warmup(2).times.sample(10).times
    end

    it 'works like a quadratic function' do
      expect do |n, _i|
        described_class.new("spec/fixtures/data#{n}0000.txt").work('spec/fixtures/tmp')
      end.to perform_power.in_range(1, 4)
    end
  end
end
