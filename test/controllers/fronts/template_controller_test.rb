require 'test_helper'

class Fronts::TemplateControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fronts_template_index_url
    assert_response :success
  end

  test "should get show" do
    get fronts_template_show_url
    assert_response :success
  end

end
