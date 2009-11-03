require 'machinist/active_record'

module InvisionBridge
  InvisionUser.blueprint do
    name { 'user' }
    mgroup { 1 }
    email { 'user@email.com' }
    converge { InvisionUserConverge.make }
    persistence_token { 'b18f1a5dc276001e6fe20139d5522755e414cdee' }
  end

  InvisionUserConverge.blueprint do
    converge_pass_hash { '9c4acc137217b795b4d487bba53f5e7d' } # pass!word salted with 'salt'
    converge_pass_salt { 'salt' }
  end
end