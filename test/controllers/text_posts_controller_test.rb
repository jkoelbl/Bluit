require 'test_helper'

class TextPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get text_posts_index_url
    assert_response :success
  end

  test "should get show" do
    get text_posts_show_url
    assert_response :success
  end

  test "should get new" do
    get text_posts_new_url
    assert_response :success
  end

  test "should get edit" do
    get text_posts_edit_url
    assert_response :success
  end

end
