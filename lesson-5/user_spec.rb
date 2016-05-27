require "spec_helper"

class User
  def self.find_by_login_or_email
  end

  def become_admin
    self.role = "admin"
  end

  def notify_friends_about_birthday
  end

  def avatar
  end

  def friends
  end
end

RSpec.describe "User" do
  describe "self" do
    describe "find by login or email" do
      it "should find user by email" do
      end
    end
  end

  describe "making admin" do
    it "should set role to 'admin'" do
    end
  end

  describe ".notify_friend_about_birthday" do
    it "calls new BirthdayEmail(friends).deliver" do
    end
  end

  describe "user's avatar" do
    context "when profile_pic is not set" do
      it "should return default_avatar.png" do
      end
    end

    context "when profile_pic is set" do
      it "should return it as is" do
      end
    end
  end

  describe "user's friends" do
    it "should return users having corresponding key in friendship table" do
    end
  end
end
