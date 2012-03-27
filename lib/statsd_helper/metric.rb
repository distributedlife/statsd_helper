module StatsdHelper
	class Metric
		def self.standard_prefix
			company = get_env 'COMPANY'
			product = get_env 'PRODUCT'
			environment = get_env 'ENV'
			release = get_env 'RELEASE'

			"#{company}.#{product}.#{environment}.#{release}.metrics".downcase
		end

		def self.standard_name metric
			"#{standard_prefix}.#{metric}".downcase
		end

		def self.get_env key
			ENV[key].nil? ? "#{key}-unset" : ENV[key]
		end
	end
end
