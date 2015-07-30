require 'spec_helper'

describe 'yum-passenger::default' do
  context 'yum-passenger::default uses default attributes' do
    let(:chef_run) do
      ChefSpec::Runner.new do |node|
        node.set['yum']['passenger']['managed'] = true
        node.set['yum']['passenger-source']['managed'] = true
      end.converge(described_recipe)
    end

    %w(
      passenger
      passenger-source
    ).each do |repo|
      it "creates yum_repository[#{repo}]" do
        expect(chef_run).to create_yum_repository(repo)
      end
    end

  end
end
