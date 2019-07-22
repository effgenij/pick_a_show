require 'rspec'
require_relative '../lib/show'

describe 'Show' do
  let(:params) {
    {
      id: '1',
      title: 'Сериал',
      year: '1990 - 1998',
      country: 'Страна',
      genres: 'Жанр',
      rate: '9.256'
    }
  }


  it 'assigns instance variables' do
    show = Show.new(params)
    expect(show.id).to eq '1'
    expect(show.title).to eq 'Сериал'
    expect(show.year).to eq '1990 - 1998'
    expect(show.country).to eq 'Страна'
    expect(show.genres).to eq 'Жанр'
    expect(show.rate).to eq '9.256'
  end
end
