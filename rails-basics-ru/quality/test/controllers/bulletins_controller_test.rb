# frozen_string_literal: true

require 'test_helper'

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get bulletins_url

    assert_response :success
    assert_equal 'text/html; charset=utf-8', response.content_type

    assert_select 'h1', 'Bulletins'
    assert_select 'h4', 'Bulletin 1'
    assert_select 'h4', 'Bulletin 2'
  end

  test 'should show article' do
    bulletin = bulletins(:bulletin1)
    get bulletin_path(bulletin.id)

    assert_response :success
    assert_equal 'text/html; charset=utf-8', response.content_type

    assert_select 'h1', 'Bulletin 1'
    assert_select 'p', 'This is the body of Bulletin 1.'
  end
end
