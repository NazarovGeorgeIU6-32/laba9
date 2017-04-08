require 'test_helper'

class CalcControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get calc_input_url
    assert_response :success
  end

  test "should get view" do
    get calc_view_url
    assert_response :success
  end
  
  test "should get 11 for view with with 1+10" do
	get :view, {v1: 1, v2: 10, op: '+'}
	assert_equal assigns[:result], 11
  end
  
  test "should get Unknown! for incorrect params" do
	get :view
	assert_equal assigns[:result], 'Unknown!'
  end

end
