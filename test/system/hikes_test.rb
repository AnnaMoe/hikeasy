require "application_system_test_case"

class HikesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_url
  
    # save_and_open_screenshot
    assert_selector "div", text: "Welcome to HikEasy" # if it is true, the test passed
    
  end

  test "visiting the hikes index" do
    visit hikes_url
  
    # save_and_open_screenshot
    assert_selector "div", text: "Hike Results:" # if it is true, the test passed
  end

  test "hike details page" do 
    login_as users(:anna)
    visit "/hikes/#{hikes(:malerweg).id}"

    # save_and_open_screenshot
    assert_selector "div", text: "Malerweg"
  end

  test "displays as much cards on Index as Hikes in db" do
    # choose screen size
    # page.driver.browser.manage.window.resize_to(1024,1024) #Mention it here

    visit hikes_url
    
    # scroll to bottom, after visiting the page, before taking the screenshot
    page.execute_script "window.scrollBy(0,10000)"

    # save_and_open_screenshot
    assert_selector ".card-product", count: Hike.count
  end

  test "lets a signed in user create a new booking" do
    login_as users(:anna)
    visit "/hikes/#{hikes(:malerweg).id}"
    #save_and_open_screenshot

    page.execute_script "window.scrollBy(0,10000)"
    click_on 'Book Now'
    #save_and_open_screenshot

    fill_in "First name", with: "Anna"
    # fill_in "last_name", with: "Moe"
    # fill_in "email", with: "anna@hikeasy.fit"
    fill_in "booking[phone_number]", with: "01763439489"
    select "May", :from => "booking[credit_card_expiration_month]"
    select "2023", :from => "booking[credit_card_expiration_year]"
    fill_in "booking[credit_card_cvc]", with: 322
    fill_in "booking[credit_card]", with: "4422442244224422"
    click_on 'Confirm booking'
    # save_and_open_screenshot

    # # Should be redirected to dashboard
    assert_equal dashboard_path, page.current_path

    #assert_redirected_to dashboard_path
    #assert_equal "dashboard", page.current_path
    #   assert_text "Creating a booking"

  end

  # test "lets a signed in user create a new review" do
  #  login_as users(:anna)
    # visit "/hikes/#{hikes(:malerweg)}/bookings/:booking_id/reviews/new"
    # # save_and_open_screenshot

    # fill_in "comment", with: "Amazing experience"
    # fill_in "rating", with: "5"
    # # save_and_open_screenshot

    # click_on 'Submit Review'
    # # save_and_open_screenshot

    # # Should be redirected to Show Hike Page with new review
    # assert_equal "/hikes/:id", page.current_path
    # assert_text "Amazing experience"
 # end
end
