module System
  def self.verify_active?
    raise NoActiveUsersError unless User.where.not(confirmed_at: nil).exists?

    true
  end
end
