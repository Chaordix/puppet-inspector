require 'spec_helper'
describe 'inspector' do

  context 'with defaults for all parameters' do
    it { should contain_class('inspector') }
  end
end
