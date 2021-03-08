require 'spec_helper'

RSpec.describe DevOrbit::Client do
  let(:subject) do
    DevOrbit::Client.new(
      dev_api_key: '12345',
      dev_username: 'test',
      orbit_api_key: '12345',
      orbit_workspace: 'test' 
    )
  end

  it 'initializes with arguments passed in directly' do
    expect(subject).to be_truthy
  end

  it 'initializes with credentials from environment variables' do
    allow(ENV).to receive(:[]).with('DEV_API_KEY').and_return('12345')
    allow(ENV).to receive(:[]).with('DEV_USERNAME').and_return('test')
    allow(ENV).to receive(:[]).with('ORBIT_API_KEY').and_return('12345')
    allow(ENV).to receive(:[]).with('ORBIT_WORKSPACE').and_return('test')

    expect(DevOrbit::Client).to be_truthy
  end
end