require 'spec_helper'

set :os, :family => 'darwin'

describe commands.command_class('package').create do
  it { should be_an_instance_of(Specinfra::Command::Darwin::Base::Package) }
end

describe package('httpd') do
  it { should be_installed }
end

describe package('invalid-package') do
  it { should_not be_installed }
end

describe package('httpd') do
  it { should be_installed.with_version('2.2.15-28.el6') }
end

describe package('httpd') do
  it { should_not be_installed.with_version('invalid-version') }
end
