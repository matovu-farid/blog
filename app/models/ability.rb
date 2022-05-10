# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new
      can :read, Post
      return unless user.present?
      can [:destroy,:create,:update],Post, author:user
      return unless user.role == 'admin'
      can :destroy,Post
  end
end
