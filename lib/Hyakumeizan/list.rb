require 'yaml'

module Hyakumeizan
  class List
    class NoMountainDataError < StandardError; end

    class << self
      def all
        @mountains ||= Dir["#{__dir__}/data/*.yml"].map { |file| YAML.load_file(file) }
      end

      def filter_by_prefecture(prefecture)
        all.select { |mountain| mountain[:prefecture].match(prefecture) }
      end

      %w[name_ja name_en].each do |name|
        define_method("find_by_#{name}") do |arg|
          target_mountain = all.find { |mountain| mountain[:"#{name}"] == arg }
          return raise_no_mountain_data_error!(arg) if target_mountain.nil?
          target_mountain
        end
      end

      private

      def raise_no_mountain_data_error!(name)
        raise NoMountainDataError.new("Can't find a #{name} in data. Please check your input name is correct name.")
      end
    end
  end
end
