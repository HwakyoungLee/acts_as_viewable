require 'test_helper'

class ActsAsViewableTest < ActiveSupport::TestCase
  def setup
    @user = User.create(email: 'young@8curz.com', name: 'Hwakyoung Lee')
    @page = Page.create(title: 'signup page')
  end

  test 'viewed_by를 호출하고 봤는지 여부 확인' do
    assert !@page.viewed_by?(@user)
    @page.viewed_by @user
    assert @page.viewed_by?(@user)
  end

  test 'viewed 메소드 호출하고 봤는지 여부 확인' do
    assert !@user.viewed?(@page)
    @user.viewed @page
    assert @user.viewed?(@page)
  end

  test 'times_viewed 값 변경 확인' do
    @user.viewed @page
    assert_equal 1, @page.reload.times_viewed
    assert_equal 1, @user.find_view_for(@page).times_viewed

    @user.viewed @page
    assert_equal 1, @page.reload.times_viewed
    assert_equal 2, @user.find_view_for(@page).times_viewed
  end

  test 'viewed_by return값' do
    assert @page.viewed_by(@user)
    assert !@page.viewed_by(@user)
  end
end
