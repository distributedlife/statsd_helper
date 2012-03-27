require 'spec_helper'

module StatsdHelper
	describe Metric do
		let(:company){'distributedlife'}
		let(:product){'statsd_helper'}
		let(:environment){'development'}
		let(:release){'1_0'}

		before(:each) do
			ENV['COMPANY'] = company
			ENV['PRODUCT'] = product
			ENV['ENV'] = environment
			ENV['RELEASE'] = release
		end

		describe 'standard_prefix' do
			let(:subject) {Metric.standard_prefix}

			it 'should retrieve the company, product, environment and release dot joined' do
				subject.should == "#{company}.#{product}.#{environment}.#{release}.metrics"	
			end

			it 'should downcase the returned string' do
				ENV['COMPANY'] = 'DISTRIBUTEDLIFE'

				subject.should == "#{company}.#{product}.#{environment}.#{release}.metrics"	
			end
		end

		describe 'standard_name' do
			let(:subject) {Metric.standard_name "HELLO"}

			it 'should return the prefix and the metric name joined with a dot' do
				subject.should == "#{company}.#{product}.#{environment}.#{release}.metrics.hello"	
			end

			it 'should downcase the returned string' do
				subject.should == "#{company}.#{product}.#{environment}.#{release}.metrics.hello"	
			end
		end

		describe 'get_env' do
			let(:subject){Metric.get_env('BANANA')}

			it 'should return the key-unset when the environment variable is not set' do
				subject.should == "BANANA-unset"
			end

			it 'should return the value when set' do
				ENV['BANANA'] = 'cavendish'

				subject.should == "cavendish"
			end
		end	
	end
end
