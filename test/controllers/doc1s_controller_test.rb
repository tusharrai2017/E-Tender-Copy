require 'test_helper'

class Doc1sControllerTest < ActionController::TestCase
  setup do
    @tender = tenders(:one)
    @doc1 = doc1s(:one)
  end

  test "should get index" do
    get :index, params: { tender_id: @tender }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { tender_id: @tender }
    assert_response :success
  end

  test "should create doc1" do
    assert_difference('Doc1.count') do
      post :create, params: { tender_id: @tender, doc1: @doc1.attributes }
    end

    assert_redirected_to tender_doc1_path(@tender, Doc1.last)
  end

  test "should show doc1" do
    get :show, params: { tender_id: @tender, id: @doc1 }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { tender_id: @tender, id: @doc1 }
    assert_response :success
  end

  test "should update doc1" do
    put :update, params: { tender_id: @tender, id: @doc1, doc1: @doc1.attributes }
    assert_redirected_to tender_doc1_path(@tender, Doc1.last)
  end

  test "should destroy doc1" do
    assert_difference('Doc1.count', -1) do
      delete :destroy, params: { tender_id: @tender, id: @doc1 }
    end

    assert_redirected_to tender_doc1s_path(@tender)
  end
end
