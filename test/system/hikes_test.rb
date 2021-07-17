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

  test "let a signed in user create a new booking" do
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
    # assert equal that the current path is the dashboard path
    assert_equal dashboard_path, page.current_path
  end

  test "let a signed in user create a new review" do
   login_as users(:anna)
   puts "/hikes/#{hikes(:malerweg).id}/bookings/#{bookings(:booking_malerweg).id}/reviews/new"
    visit "/hikes/#{hikes(:malerweg).id}/bookings/#{bookings(:booking_malerweg).id}"
    #save_and_open_screenshot

    click_on 'Leave a Review'
    fill_in "review[comment]", with: "Amazing experience"
    select "5", :from => "review[rating]"
    #save_and_open_screenshot

    click_on 'Submit review'
    #save_and_open_screenshot

    # # Should be redirected to Show Hike Page with new review
    assert_equal "/hikes/#{hikes(:malerweg).id}", page.current_path
    #assert_text "Amazing experience"
  end

  test "let a signed in user write a message on the group page" do
    login_as users(:anna)
    visit "/hikes/#{hikes(:malerweg).id}/bookings/#{bookings(:booking_malerweg).id}/chatroom"
    #save_and_open_screenshot
    fill_in "message[content]", with: 'Hello everyone'
    find('#message_content').native.send_keys(:return)
    # needed to wait website render again before screenshot
    fill_in "message[content]", with: '' 
    save_and_open_screenshot
  end
end
