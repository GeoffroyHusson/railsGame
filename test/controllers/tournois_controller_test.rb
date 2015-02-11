require 'test_helper'

class TournoisControllerTest < ActionController::TestCase
  setup do
    @tournoi = tournois(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tournois)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tournoi" do
    assert_difference('Tournoi.count') do
      post :create, tournoi: { date: @tournoi.date, name: @tournoi.name, nbPlayerMax: @tournoi.nbPlayerMax, place: @tournoi.place }
    end

    assert_redirected_to tournoi_path(assigns(:tournoi))
  end

  test "should show tournoi" do
    get :show, id: @tournoi
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tournoi
    assert_response :success
  end

  test "should update tournoi" do
    patch :update, id: @tournoi, tournoi: { date: @tournoi.date, name: @tournoi.name, nbPlayerMax: @tournoi.nbPlayerMax, place: @tournoi.place }
    assert_redirected_to tournoi_path(assigns(:tournoi))
  end

  test "should destroy tournoi" do
    assert_difference('Tournoi.count', -1) do
      delete :destroy, id: @tournoi
    end

    assert_redirected_to tournois_path
  end
end
