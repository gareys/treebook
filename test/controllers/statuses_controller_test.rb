require 'test_helper'

class StatusesControllerTest < ActionController::TestCase
  setup do
    @status = statuses(:one)
  end

  # GET INDEX
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:statuses)
  end

  test "should not display blocked user's posts when logged in" do
    sign_in users(:garey)
    users(:blocked_friend).statuses.create(content: 'Blocked status')
    users(:jim).statuses.create(content: 'Non-blocked status')
    get :index
    assert_match /Non\-blocked status/, response.body
    assert_no_match /Blocked\ status/, response.body
  end

  test "should display blocked user's posts when not logged in" do
    users(:blocked_friend).statuses.create(content: 'Blocked status')
    users(:jim).statuses.create(content: 'Non-blocked status')
    get :index
    assert_match /Non\-blocked status/, response.body
    assert_match /Blocked\ status/, response.body
  end
  
  # GET NEW    
  test "should be redirected when not logged in" do
    get :new
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should render the new page when logged in" do
    sign_in users(:garey)
    get :new
    assert_response :success
  end  

  # POST CREATE    
  test "should be logged in to post a status" do
    post :create, status: {content: "Hello"}
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end
  
  test "should create status when logged in" do
    sign_in users(:garey)
    assert_difference('Status.count') do
      post :create, status: { content: @status.content}
    end

    assert_redirected_to status_path(assigns(:status))
  end

  test "should create an activity item for the status when logged in" do
    sign_in users(:garey)
    assert_difference('Activity.count') do
      post :create, status: { content: @status.content}
    end
  end

 test "should create status for the current user when logged in" do
    sign_in users(:garey)
    assert_difference('Status.count') do
      post :create, status: { content: @status.content, user_id: users(:jim).id}
    end

    assert_redirected_to status_path(assigns(:status))
    assert_equal assigns(:status).user_id, users(:garey).id
  end
  
  
  # GET SHOW    
  test "should show status" do
    get :show, id: @status
    assert_response :success
  end
 
  # GET EDIT    
  test "should be logged in to edit a status" do
    get :edit, id: @status
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end  

  test "should render edit page when logged in" do
    sign_in users(:garey)
    get :edit, id: @status
    assert_response :success
  end

  # PATCH UPDATE    
  test "should be logged in to update a status" do
    patch :update, id: @status, status: { content: @status.content }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end    
  
  test "should update status when logged in" do
    sign_in users(:garey)
    patch :update, id: @status, status: { content: @status.content }
    assert_redirected_to status_path(assigns(:status))
  end

  test "should create an activity item when the status is updated" do
    sign_in users(:garey)
    assert_difference('Activity.count') do
      patch :update, id: @status, status: { content: @status.content }
    end
  end
  
   test "should update status for the current user when logged in" do
    sign_in users(:garey)
    patch :update, id: @status, status: {content: @status.content, user_id: users(:jim).id}
    assert_redirected_to status_path(assigns(:status))
    assert_equal assigns(:status).user_id, users(:garey).id      
  end 

#   test "should  not update the status if nothing has changed" do
#    sign_in users(:garey)
#    patch :update, id: @status
#    assert_redirected_to status_path(assigns(:status))
#    assert_equal assigns(:status).user_id, users(:garey).id      
#  end   

  # DELETE DESTROY    
  test "should destroy status" do
    sign_in users(:garey)
    assert_difference('Status.count', -1) do
      delete :destroy, id: @status
    end

    assert_redirected_to statuses_path
  end

  test "should create an activity on destroy status" do
    sign_in users(:garey)
    assert_difference('Activity.count', 1) do
      delete :destroy, id: @status
    end
  end


end