# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new
      can :read, Post
      can :read, Comment
      return unless user.present?
      can [:destroy,:create,:update],Post, author:user
      can [:destroy,:create,:update],Comment, author:user
      return unless user.role == 'admin'
      can :destroy,Post
      can :destroy,Comment
  end
end
