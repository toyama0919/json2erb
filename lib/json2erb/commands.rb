#! /usr/bin/env ruby
require 'thor'
require 'yajl'
require 'erb'

module Json2erb
  class Commands < Thor
    map '-i' => :inline
    def initialize(args = [], options = {}, config = {})
      super(args, options, config)
      @global_options = config[:shell].base.options
    end

    desc "-i", %Q{exsample. echo {"fuga":"hoge"} | json2erb -i -e test.erb}
    option :json, aliases: '-j', type: :string, default: nil, desc: 'json file'
    option :erb, aliases: '-e', type: :string, default: nil, required: true, desc: 'erb file'
    def inline
      erb = options['erb']
      buffer = options['json'].nil? ? STDIN.read : File.read(options['json'])
      @data = parse_json(buffer)
      puts ERB.new(File.read(erb), nil, '-').result(binding)
    end

    private

    def parse_json(buffer)
      begin
        data = Yajl::Parser.parse(buffer)
      rescue => e
        data = []
        buffer.split("\n").each do |line|
          data << Yajl::Parser.parse(line)
        end
      end
      data
    end
  end
end
