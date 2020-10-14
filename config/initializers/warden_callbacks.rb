Warden::Manager.after_authentication do |user, _auth, _opts|
  Event.create!(
    trackable_type: 'User',
    trackable_id: user.id,
    key: 'user.signed_in',
    owner_type: 'User',
    owner_id: user.id
  )
end

Warden::Manager.before_logout do |user, _auth, _opts|
  Event.create!(
    trackable_type: 'User',
    trackable_id: user.id,
    key: 'user.signed_out',
    owner_type: 'User',
    owner_id: user.id
  )
end
