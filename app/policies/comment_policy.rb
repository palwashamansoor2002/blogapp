class CommentPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def create?
    user.present?
  end

  def update?
    return false unless user
    user.admin? || comment.user_id == user.id
  end

  def destroy?
    update?
  end
end
