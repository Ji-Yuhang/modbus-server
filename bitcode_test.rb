#!/usr/bin/ruby
require "./bitcode"
require "ap"
=begin
require "listen"
require "rb-inotify"
notifier = INotify::Notifier.new
notifier.watch("bitcode.rb",:modify) {
    puts "bitcode.rb was modified"
}
=end
puts "test bitcode"

def test
    include BitCode
    code03 = BitCode.make03code
    code10 = BitCode.make10code

    puts code03
    puts code10
end
=begin
listener = Listen.to('/bitcode.rb') do
    if modified.size > 0
        puts "bitcode.rb was modified"
        test()
    end
end
listener.start
sleep
=end

test()

