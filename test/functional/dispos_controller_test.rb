require 'test_helper'

class DisposControllerTest < ActionController::TestCase
  setup do
    @dispo = dispos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dispos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dispo" do
    assert_difference('Dispo.count') do
      post :create, :dispo => { :jour => @dispo.jour, :statut_id => @dispo.statut_id, :user_id => @dispo.user_id }
    end

    assert_redirected_to dispo_path(assigns(:dispo))
  end

  test "should show dispo" do
    get :show, :id => @dispo
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @dispo
    assert_response :success
  end

  test "should update dispo" do
    put :update, :id => @dispo, :dispo => { :jour => @dispo.jour, :statut_id => @dispo.statut_id, :user_id => @dispo.user_id }
    assert_redirected_to dispo_path(assigns(:dispo))
  end

  test "should destroy dispo" do
    assert_difference('Dispo.count', -1) do
      delete :destroy, :id => @dispo
    end

    assert_redirected_to dispos_path
  end
end
