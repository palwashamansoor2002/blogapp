class PostPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    return false unless user
    user.admin? || post.user_id == user.id
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end
end
