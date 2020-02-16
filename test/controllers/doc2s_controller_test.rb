require 'test_helper'

class Doc2sControllerTest < ActionController::TestCase
  setup do
    @tender = tenders(:one)
    @doc2 = doc2s(:one)
  end

  test "should get index" do
    get :index, params: { tender_id: @tender }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { tender_id: @tender }
    assert_response :success
  end

  test "should create doc2" do
    assert_difference('Doc2.count') do
      post :create, params: { tender_id: @tender, doc2: @doc2.attributes }
    end

    assert_redirected_to tender_doc2_path(@tender, Doc2.last)
  end

  test "should show doc2" do
    get :show, params: { tender_id: @tender, id: @doc2 }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { tender_id: @tender, id: @doc2 }
    assert_response :success
  end

  test "should update doc2" do
    put :update, params: { tender_id: @tender, id: @doc2, doc2: @doc2.attributes }
    assert_redirected_to tender_doc2_path(@tender, Doc2.last)
  end

  test "should destroy doc2" do
    assert_difference('Doc2.count', -1) do
      delete :destroy, params: { tender_id: @tender, id: @doc2 }
    end

    assert_redirected_to tender_doc2s_path(@tender)
  end
end
