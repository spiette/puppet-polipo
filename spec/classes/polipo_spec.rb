require 'spec_helper'

describe 'polipo' do
  let(:title) { 'polipo' }

  ['Debian', 'RedHat'].each do |osfamily|
    describe "class without any parameters on #{osfamily}" do 
      let(:params) {{ }}
      let(:facts) { { :osfamily => osfamily } }

      it { should create_class('polipo') }
      it { should create_package('polipo') }
      it { should create_file('/etc/polipo/config') }
      it {
        should create_file('/etc/polipo/config')\
        .with_content(/proxyAddress/)\
        .with_content(/allowedClients/)
      }
      it { should create_service('polipo') }
      if osfamily == 'RedHat' 
        it { should create_file('/etc/polipo/config')\
        .with_content(/^daemonise = true$/) }
      end
    end
  end
end
