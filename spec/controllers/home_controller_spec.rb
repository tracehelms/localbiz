require 'spec_helper'

describe HomeController do

  it 'should get index' do
    get :index
    expect(response).to be_success
    expect(response.status).to eq(200)
  end

end
