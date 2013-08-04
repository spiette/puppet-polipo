require 'spec_helper'

describe 'polipo' do
  let(:title) { 'polipo' }

  describe "class without any parameters on RedHat < 7" do
    let(:params) {{ }}
    let(:facts) { {
      :osfamily => 'RedHat',
      :operatingsystemmajrelease => '6'
    } }
    it { should create_file('/etc/polipo/config')\
      .with_content(/^logFile = .var.log.polipo$/) }
  end
  ['Debian', 'RedHat'].each do |osfamily|
    describe "class without any parameters on #{osfamily}" do
      let(:params) {{ }}
      let(:facts) { {
        :osfamily => osfamily,
        :operatingsystemmajrelease => '7'
      } }
      case osfamily
      when 'Debian'
        group = 'proxy'
        hasstatus = false
      when 'RedHat'
        group = 'polipo'
        hasstatus = true
      end

      it { should create_class('polipo') }
      it { should create_package('polipo') }
      it { should create_file('/etc/polipo/config')\
        .with_mode('0440')\
        .with_group(group)
      }
      it { should create_file('/etc/polipo/config')\
        .with_content(/proxyAddress/)\
        .with_content(/allowedClients/)
      }
      it { should create_service('polipo')\
        .with_hasstatus(hasstatus) }
      if osfamily == 'RedHat' 
        it { should create_file('/etc/polipo/config')\
        .with_content(/^daemonise = true$/)\
        .with_content(/^logFile = .var.log.polipo.polipo.log/) }
      end
    end
    describe "class with options parameters on #{osfamily}" do
      let(:params) {{
        :options => {
          'proxyAddress'   => '0.0.0.0',
          'allowedClients' => '127/8, 192.168.122.0/24'
        }
      }}
      let(:facts) { {
        :osfamily => osfamily,
        :operatingsystemmajrelease => '7'
      } }
      it {
        should create_file('/etc/polipo/config')\
        .with_content(/^proxyAddress = 0.0.0.0$/)\
        .with_content(/^allowedClients = 127.8, 192.168.122.0.24$/)
      }
    end
  end
end
