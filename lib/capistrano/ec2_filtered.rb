require "capistrano"
require "aws-sdk"

module Capistrano
  module Ec2Filtered
    def ec2_filtered(filters = [])
      ec2 ||= Aws::EC2::Client.new
      if filters.size == 0 then
        return []
      end
      filters << { name: "instance-state-code", values: ["16"] }
      r = ec2.describe_instances(filters: filters)
      instances = r.reservations.reduce([]) {|sum, a| sum.concat(a.instances)}

      instances.map { |instance| instance.public_ip_address || instance.private_ip_address }
    end
  end
end

extend  Capistrano::Ec2Filtered
