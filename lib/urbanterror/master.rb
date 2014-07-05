module UrbanTerror
  # Master Class. Allow to communicate with the master server to retreive game server list
  class Master

    # Initialize the class with  master informations
    #
    # @param server [String] Server IP or adress
    # @param port [Fixnum] Server port
    # @param timeout [Fixnum] Time, in seconds, to wait for a server reply
    def initialize(server, port=27900, timeout=3)
      @server  = server
      @port    = port
      @timeout = timeout

      @magic = 255.chr * 4
      @response_header = @magic + "getserversResponse\\"
      @end   = "EOT" + 0.chr + 0.chr

      @socket = UDPSocket.open
      @socket.connect(server, port)
    end

    # Grab server list from master server
    # 
    # @return [Array] Game server list
    def grab_server_list
      buffers  = []
      server_list = []

      @socket.send("#{@magic}getservers 68 full empty", 0)

      while IO::select([@socket], nil, nil, @timeout)
        buffers <<  @socket.recv(163840000)
      end

      buffers.each do |buffer|

        buffer = buffer[@response_header.length..-1]
        split = buffer.split('\\')

        split.each do |thing|
          puts "#{thing} -- size #{thing.size}"
          next if thing.include? @end
          next unless thing.size == 6

          # Build the IP
          host = ""
          for i in 0...4
            host << '.' unless i == 0
            host = "#{host}#{thing[i].ord}" 
          end

          # Build the port
          port = 0
          port += 256 * thing[4].ord
          port += thing[5].ord

          puts "#{host}:#{port}"
          server_list << "#{host}:#{port}"
        end
      end

      return server_list
    end
  end
end
