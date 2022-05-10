class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, Post
    can :read, Comment
    return unless user.present?

    can %i[destroy create update], Post, author: user
    can %i[destroy create update], Comment, author: user
    return unless user.role == 'admin'

    can :destroy, Post
    can :destroy, Comment
  end
end
