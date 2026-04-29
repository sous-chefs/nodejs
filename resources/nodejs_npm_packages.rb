# frozen_string_literal: true

provides :nodejs_npm_packages
unified_mode true

property :packages, Array, default: []

default_action :install

action :install do
  new_resource.packages.each do |pkg|
    package_properties = normalize_package(pkg)
    pkg_action = package_properties.delete(:action) || :install
    pkg_name = package_properties.delete(:package)

    npm_package "nodejs_npm-#{pkg_name}-#{pkg_action}" do
      package pkg_name
      package_properties.each do |property_name, property_value|
        send(property_name, property_value)
      end
      action pkg_action.to_sym
    end
  end
end

action :remove do
  new_resource.packages.each do |pkg|
    package_properties = normalize_package(pkg)
    pkg_name = package_properties[:package]

    npm_package "nodejs_npm-#{pkg_name}-remove" do
      package pkg_name
      action :remove
    end
  end
end

action_class do
  def normalize_package(pkg)
    pkg.each_with_object({}) do |(key, value), memo|
      property_name = key.to_sym
      property_name = :package if property_name == :name
      memo[property_name] = value
    end
  end
end
