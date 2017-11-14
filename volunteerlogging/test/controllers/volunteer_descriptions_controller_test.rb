require 'test_helper'

class VolunteerDescriptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @volunteer_description = volunteer_descriptions(:one)
  end

  test "should get index" do
    get volunteer_descriptions_url
    assert_response :success
  end

  test "should get new" do
    get new_volunteer_description_url
    assert_response :success
  end

  test "should create volunteer_description" do
    assert_difference('VolunteerDescription.count') do
      post volunteer_descriptions_url, params: { volunteer_description: { datesAvail: @volunteer_description.datesAvail, infoVolunteer: @volunteer_description.infoVolunteer, volunteerId: @volunteer_description.volunteerId } }
    end

    assert_redirected_to volunteer_description_url(VolunteerDescription.last)
  end

  test "should show volunteer_description" do
    get volunteer_description_url(@volunteer_description)
    assert_response :success
  end

  test "should get edit" do
    get edit_volunteer_description_url(@volunteer_description)
    assert_response :success
  end

  test "should update volunteer_description" do
    patch volunteer_description_url(@volunteer_description), params: { volunteer_description: { datesAvail: @volunteer_description.datesAvail, infoVolunteer: @volunteer_description.infoVolunteer, volunteerId: @volunteer_description.volunteerId } }
    assert_redirected_to volunteer_description_url(@volunteer_description)
  end

  test "should destroy volunteer_description" do
    assert_difference('VolunteerDescription.count', -1) do
      delete volunteer_description_url(@volunteer_description)
    end

    assert_redirected_to volunteer_descriptions_url
  end
end
