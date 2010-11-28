require 'test_helper'

class CardCardboxesControllerTest < ActionController::TestCase
  setup do
    @card_cardbox = card_cardboxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:card_cardboxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create card_cardbox" do
    assert_difference('CardCardbox.count') do
      post :create, :card_cardbox => @card_cardbox.attributes
    end

    assert_redirected_to card_cardbox_path(assigns(:card_cardbox))
  end

  test "should show card_cardbox" do
    get :show, :id => @card_cardbox.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @card_cardbox.to_param
    assert_response :success
  end

  test "should update card_cardbox" do
    put :update, :id => @card_cardbox.to_param, :card_cardbox => @card_cardbox.attributes
    assert_redirected_to card_cardbox_path(assigns(:card_cardbox))
  end

  test "should destroy card_cardbox" do
    assert_difference('CardCardbox.count', -1) do
      delete :destroy, :id => @card_cardbox.to_param
    end

    assert_redirected_to card_cardboxes_path
  end
end
