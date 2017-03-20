require 'test_helper'

class SignupUsersTest < ActionDispatch::IntegrationTest
   
   test 'Get Singup form and Create User' do
      get signup_path
      assert_template 'users/new'
      assert_difference 'User.count', 1 do
         post_via_redirect users_path, user: {username: "sufyan", email: "sufyan@example.com", password: "password"}
      end
      assert_template 'users/show'
      assert_match "sufyan", response.body
   end
end