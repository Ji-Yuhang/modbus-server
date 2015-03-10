#!/usr/bin/ruby
require "ap"
require "pp"
module BitCode
    def make03code
        a = 0x15010000
        head = [0x15,0x01,0x00,0x00,0x00,0x06,0x01,0x03,0x00,0x00,0x00,0x40]
        re = head.pack("CCCC")
        ap re
        pp re
        puts re.to_s
    end
    def make10code
    end
    
end
