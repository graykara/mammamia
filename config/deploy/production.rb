set :port, 1026
set :user, 'deployer'
set :deploy_via, :remote_cache
set :use_sudo, false

server '14.63.164.171',
    roles: [:web, :app, :db],
    port: fetch(:port),
    user: fetch(:user),
    primary:true

set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"

set :ssh_options, {
        forward_agent: true,
        auth_methods: %w(publickey),
        user: 'deployer',
}

set :rails_env, :production
set :conditionally_migrate, true


# set :stage, :production
#
# # Simple Role Syntax
# # ==================
# # Supports bulk-adding hosts to roles, the primary
# # server in each group is considered to be the first
# # unless any hosts have the primary property set.
# role :app, %w{deploy@example.com}
# role :web, %w{deploy@example.com}
# role :db,  %w{deploy@example.com}
#
# # Extended Server Syntax
# # ======================
# # This can be used to drop a more detailed server
# # definition into the server list. The second argument
# # something that quacks like a hash can be used to set
# # extended properties on the server.
# server 'example.com', user: 'deploy', roles: %w{web app}, my_property: :my_value
#
# # you can set custom ssh options
# # it's possible to pass any option but you need to keep in mind that net/ssh understand limited list of options
# # you can see them in [net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start)
# # set it globally
# #  set :ssh_options, {
# #    keys: %w(/home/rlisowski/.ssh/id_rsa),
# #    forward_agent: false,
# #    auth_methods: %w(password)
# #  }
# # and/or per server
# # server 'example.com',
# #   user: 'user_name',
# #   roles: %w{web app},
# #   ssh_options: {
# #     user: 'user_name', # overrides user setting above
# #     keys: %w(/home/user_name/.ssh/id_rsa),
# #     forward_agent: false,
# #     auth_methods: %w(publickey password)
# #     # password: 'please use keys'
# #   }
# # setting per server overrides global ssh_options
#
# # fetch(:default_env).merge!(rails_env: :production)
