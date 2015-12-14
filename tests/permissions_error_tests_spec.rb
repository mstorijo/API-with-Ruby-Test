require 'airborne'

describe 'Post a invalid request with missing name' do
  it 'should return 400' do
    puts '/apps/:appid',
         {
             'domain' => 'https://my.domain.com',
             'permissions' => ['A', 'C']
         },

         {'x-auth-token' => 'my_token'}
    expect_status(400)
  end
end

describe 'Post a invalid request with missing domain' do
  it 'should return 400' do
    puts '/apps/:appid',
         {
             'name' => 'MyApp',
             'permissions' => ['A', 'C']
         },

         {'x-auth-token' => 'my_token'}
    expect_status(400)
  end
end

describe 'Post a invalid request with missing permissions' do
  it 'should return 400' do
    puts '/apps/:appid',
         {
             'name' => 'MyApp',
             'domain' => 'https://my.domain.com'
         },

         {'x-auth-token' => 'my_token'}
    expect_status(400)
  end
end


describe 'Post a invalid request with additional field time' do
  it 'should return 400' do
    puts '/apps/:appid',
         {
             'name' => 'MyApp',
             'time' => 'PartyTime',
             'domain' => 'https://my.domain.com',
             'permissions' => ['A', 'C']
         },

         {'x-auth-token' => 'my_token'}
    expect_status(400)
  end
end

describe 'Post a request with wrong name' do
  it 'should return 403' do
    puts '/apps/:appid',
         {
             'name' => 'MyAppTastic',
             'domain' => 'https://my.domain.com',
             'permissions' => ['A', 'C']
         },

         {'x-auth-token' => 'my_token'}
    expect_status(403)
  end
end

describe 'Post a request with wrong domain' do
  it 'should return 403' do
    puts '/apps/:appid',
         {
             'name' => 'MyApp',
             'domain' => 'https://my.google.com',
             'permissions' => ['A', 'C']
         },

         {'x-auth-token' => 'my_token'}
    expect_status(403)
  end
end

describe 'Post a request without auth token' do
  it 'should return 403' do
    puts '/apps/:appid',
         {
             'name' => 'MyApp',
             'domain' => 'https://my.domain.com',
             'permissions' => ['A', 'C']
         }
    expect_status(403)
  end
end

describe 'Post a request with user that does not exist' do
  it 'should return 403' do
    puts '/apps/:appid',
         {
             'name' => 'MyApp',
             'domain' => 'https://my.domain.com',
             'permissions' => ['A', 'C']
         },

         {'x-auth-token' => 'some_invalid_token'}
    expect_status(403)
  end
end

describe 'Post a request with user without correct permissions' do
  it 'should return 403' do
    puts '/apps/:appid',
         {
             'name' => 'MyApp',
             'domain' => 'https://my.domain.com',
             'permissions' => ['A', 'C']
         },

         {'x-auth-token' => 'token_of_user_without_permissions'}
    expect_status(403)
  end
end

describe 'Post a request with an incorrect app id' do
  it 'should return 404' do
    puts '/apps/654567868465165',
         {
             'name' => 'MyApp',
             'domain' => 'https://my.domain.com',
             'permissions' => ['A', 'C']
         },

         {'x-auth-token' => 'my_token'}
    expect_status(404)
  end
end