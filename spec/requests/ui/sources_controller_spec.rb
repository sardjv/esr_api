describe Ui::SourcesController, type: :request do
  context 'when not authenticated' do
    describe 'GET new' do
      describe 'format.html' do
        before { get new_ui_source_path }
        it { expect(response).to redirect_to(pages_home_path) }
      end

      describe 'format.json' do
        before { get new_ui_source_path, xhr: true }
        it { expect(response).not_to be_successful }
      end
    end
  end

  context 'when authenticated' do
    before { sign_in create(:confirmed_user) }

    describe 'GET new' do
      describe 'format.html' do
        before { get new_ui_source_path }
        it { expect(response).to be_successful }
      end
    end
  end

  context 'when not authenticated' do
    describe 'POST create' do
      before { post ui_sources_path, params: { source: { name: 'test', source: build(:source).source } } }

      it { expect(response).to redirect_to(pages_home_path) }

      it 'does not create a new source' do
        expect { post ui_sources_path, params: { source: { name: 'test', source: build(:source).source } } }.not_to change(Source, :count)
      end
    end
  end

  context 'when authenticated' do
    let(:name) { build(:source).name }
    let(:source) { build(:source).source }

    before { sign_in create(:confirmed_user) }

    describe 'POST create' do
      it 'creates a new source' do
        expect do
          post ui_sources_path, params: { source: { name: name, source: source } }
        end.to change { Source.count }.by(1)
        expect(Source.last.name).to eq(name)
        expect(Source.last.source).to eq(source)
      end
    end
  end

  context 'when not authenticated' do
    let!(:source) { create(:source) }

    describe 'GET show' do
      before { get ui_source_path(source) }
      it { expect(response).to redirect_to(pages_home_path) }
    end
  end

  context 'when authenticated' do
    before { sign_in create(:confirmed_user) }

    let!(:source) { create(:source) }

    describe 'GET show' do
      before { get ui_source_path(source) }
      it { expect(response).to be_successful }

      it 'doees NOT includes the decrypted source' do
        expect(response.body).not_to include(source.source)
      end
    end
  end

  context 'when not authenticated' do
    let!(:source) { create(:source) }

    describe 'DELETE destroy' do
      before { delete ui_source_path(source) }

      it { expect(response).to redirect_to(pages_home_path) }

      it 'does not delete the source' do
        expect { delete ui_source_path(source) }.not_to change(Source, :count)
      end
    end
  end

  context 'when authenticated' do
    before { sign_in create(:confirmed_user) }

    let!(:source) { create(:source) }

    describe 'DELETE destroy' do
      it 'deletes the source' do
        expect { delete ui_source_path(source) }.to change { Source.count }.by(-1)
      end
    end
  end
end
