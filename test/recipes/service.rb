# Inspec test for recipe docker-engine::service

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

describe file('/var/run/docker.sock') do
  it { should be_socket }
end
