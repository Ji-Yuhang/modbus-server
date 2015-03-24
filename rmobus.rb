require 'rmodbus'

ModBus::TCPClient.new('192.168.12.202', 502) do |cl|
cl.with_slave(1) do |slave|
# Read a single holding register at address 16
slave.holding_registers[16]

# Write a single holding register at address 16
slave.holding_registers[16] = 123

# Read holding registers 16 through 20
slave.holding_registers[16..20]

# Write holding registers 16 through 20 with some values
slave.holding_registers[16..20] = [1, 2, 3, 4, 5]
end
end
