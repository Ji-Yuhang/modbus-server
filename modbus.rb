#!/usr/bin/ruby
require "awesome_print"
require "optparse"
require "pp"
require "socket"

ap "This is ruby program about modbus"

options = {}
option_parse = OptionParser.new do |opts|
    # 帮助信息
    opts.banner = 'here is help messages of the command line tool.'

    # Option 作为switch，不带argument，用于将switch设置成true或false
    options[:switch] = false;
    # 下面第一项是short option，第二项是long option，第三项是对Option的描述
    opts.on('-s', '--switch', 'Set options as switch') do
        options[:switch] = true;
    end
    
    # Option 作为flag, 带argument，用于将argument作为数值解析，比如"name"信息
    opts.on('-n NAME', '--name Name', 'Pass-in single name') do |value|
        options[:name] = value
    end

    # Option  作为flag，带一组用逗号分割的arguments，用于将arguments作为数组解析
    opts.on('-a A,B', '--array A,B', Array, 'List of arguments') do |value|
        options[:array] = value
    end

    # jiyuhang custom
    # listen port
    opts.on('-p Port', '--port Port', 'listen port') do |value|
        options[:port] = value
    end
end.parse!

#ap options
#pp options

localport = 5555
if options.has_key?(:port)
    localport = options[:port]
end

puts "listen port #{localport}"
server = TCPServer.open(localport)
loop {
    Thread.start(server.accept) do |client|
        loop {
            head = [0x15,0x01,0x00,0x00,0x00,0x06,0x01,0x03,0x00,0x00,0x00,0x40]
            #re = head.pack("CCCCCCCCCCCC")
            re = head.pack("C*")
            puts "send>"
            ap re
	    ap re.class
	    ap re.length

            client.write(re)
            receive = client.read()
            puts "receive>"
            ap receive
	    ap re.class
	    ap receive.length
	    ap receive.unpack("H*")
	    ap receive.unpack("h*")
	    #ap result.length
            sleep(20)
        }
    end
}






