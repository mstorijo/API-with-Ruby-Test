require 'airborne'

describe 'Post a valid request' do
  it 'should return 200' do
    puts '/apps/:appid',
        {
            'name' => 'MyApp',
            'domain' => 'https://my.domain.com',
            'permissions' => ['A', 'C']
        },

         { 'x-auth-token' => 'my_token' }
    expect_status(200)
  end


end