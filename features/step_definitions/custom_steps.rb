$:.unshift File.dirname __FILE__
require 'wait_for_activity'

Given /^I'm on the homepage$/ do
  element_exists("com.android.internal.policy.DecorView")
end

Then /^I enter my "(.+)" username$/ do |username|
  query_wait_set_text "android.support.v7.widget.AppCompatAutoCompleteTextView", username
end

Then /^I enter my "(.+)" password$/ do |password|
  query_wait_set_text "android.support.v7.widget.AppCompatEditText", password
end

Then /^I click on SIGN IN OR REGISTER button/ do
  touch "android.support.v7.widget.AppCompatButton"
end

Then /^I see picture of the house/ do
  element_exists("android.support.v7.widget.AppCompatImageView")
end

Then /^I see "(.+)" message/ do | message |
   expect(query("android.support.v7.widget.AppCompatTextView", "text")[0]).to eq(message)
end

