require 'spec_helper'

describe 'graylog2::server' do
  context 'supported operating systems' do
    describe "graylog2 class with minimal parameters on RedHat" do
      let(:params) {{
        :password_secret    => 'theiyieCh1eequep',
        :root_password_sha2 => 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f'
      }}
      let(:facts) {{
        :osfamily        => 'RedHat',
        :kernel          => 'Linux',
        :operatingsystem => 'CentOS'
      }}

      it { should compile.with_all_deps }

      it { should contain_class('graylog2::params') }

      it { should contain_class('graylog2::server::mongodb').that_comes_before('graylog2::server::elasticsearch') }
      it { should contain_class('graylog2::server::elasticsearch').that_comes_before('graylog2::server::install') }
      it { should contain_class('graylog2::server::install').that_comes_before('graylog2::server::config') }
      it { should contain_class('graylog2::server::config') }
      it { should contain_class('graylog2::server::service').that_subscribes_to('graylog2::server::config') }

      it { should contain_class('::mongodb::server') }
    end
  end

  context 'unsupported operating system' do
    describe 'graylog2 class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
