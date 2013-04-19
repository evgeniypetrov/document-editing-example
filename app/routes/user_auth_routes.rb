WebmateApp.define_routes do
#  authorization_for :user,
#    sign_in: 'custom_sign_in_path',
#    sign_out: 'custom_sign_out_path',
#    registration: 'custorm_register_path',
#    only: [:sign_in, :sign_out, :register]

  authorization_for :user
end
