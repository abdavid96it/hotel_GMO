require 'test_helper'

class Admins::TemplateControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_template_index_url
    assert_response :success
  end

end
