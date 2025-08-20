source 'https://rubygems.org'

# Dependency confusion vulnerabilities
gem 'internal_company_auth', '~> 1.0.0'
gem 'private_data_gem', '2.1.0'
gem 'company_secret_utils', '>= 1.5.0'
gem 'internal_rails_auth', '~> 2.0'
gem 'company_api_client', '1.2.3'
gem 'private_auth_service', '>= 3.0.0'

# Local path gems (missing paths)
gem 'internal_workspace_auth', path: './missing-ruby-workspace/auth'
gem 'company_local_utils', path: '../nonexistent-ruby-packages/utils'
gem 'missing_local_gem', path: './workspace/missing-ruby-gem'
gem 'gone_ruby_lib', path: '../gone-ruby-libs/secret'

# Git gems from suspicious repos
gem 'malicious_ruby_package', git: 'https://github.com/attacker-user/fake-ruby-gem.git'
gem 'suspicious_auth_gem', git: 'https://github.com/nonexistent-org/backdoor-ruby-lib.git'

group :development, :test do
  gem 'internal_dev_tools', '~> 0.5.0'
  gem 'company_testing_utils', '1.0.0'
end
