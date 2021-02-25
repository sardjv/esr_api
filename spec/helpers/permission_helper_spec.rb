require 'rails_helper'

describe PermissionHelper do
  describe '.column_options' do
    context 'with a resource' do
      let(:resource) { 'AbsenceRecord' }

      it 'returns the right options' do
        expect(
          PermissionHelper.column_options(resource: resource)
        ).to eq(
          ETL::Headers::AbsenceRecord.api_headers
        )
      end
    end

    context 'without a resource' do
      let(:resource) { nil }

      it { expect { PermissionHelper.column_options(resource: resource) }.not_to raise_error }
    end
  end

  describe '.column_options_for_select2' do
    context 'with a resource' do
      let(:resource) { 'AbsenceRecord' }

      it 'returns the right options' do
        expect(
          PermissionHelper.column_options_for_select2(resource: resource)
        ).to eq(
          ETL::Headers::AbsenceRecord.api_headers.map do |text|
            { 'id' => text, 'text' => text }
          end
        )
      end
    end

    context 'without a resource' do
      let(:resource) { nil }

      it {
        expect do
          PermissionHelper.column_options_for_select2(resource: resource)
        end.not_to raise_error
      }
    end
  end
end
