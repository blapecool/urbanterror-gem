module UrbanTerror
  # Server Class. Allow to communicate with the server to retrieve information
  # It can also control the server with the rcon password
  class Server

    # List of connected players with their nick, ping and score
    # You need to do {#update_status} before to have fresh data 
    #
    # @return [Array]
    attr_reader :players

    # Hash of public settings and their value
    # You need to do {#update_status} before to have fresh data 
    #
    # @return [Hash]
    attr_reader :settings

    # Server response of the last getstatus command sent
    #
    # @return [String]
    attr_reader :last_status

    # Set the rcon password. 
    #
    # @param [String] Rcon password
    attr_writer :rcon_password

    # Initialize the class with all server informations
    #
    # @param server [String] Server IP or adress
    # @param port [Fixnum] Server port
    # @param rcon_password [String] Server rcon password
    # @param timeout [Fixnum] Time, in seconds, to wait for a server reply
    def initialize(server, port=27960, rcon_password='', timeout=3)
      @server = server
      @port = port
      @rcon_password = rcon_password
      @timeout = timeout

      @socket = UDPSocket.open
      @socket.connect(server, port)
    end

    # Grab public information about the server by sending a query to it (no rcon needed) and build the player list and settings hash
    # 
    # @return [String] Server response to getstatus command
    def update_status
      @last_status = send_command("getstatus")

      unless @last_status == false
        # Build the settings hash
        result = get_status_parts(1).split("\\").reject(&:empty?)
        @settings = Hash[*result]

        # Build the player list
        @players = []
        results = get_status_parts(2..-1)
        results.map do |player|
          player = player.split(" ", 3)
          @players << { :name => player[2][1..-2], :ping => player[1].to_i, :score => player[0].to_i }
        end
      end

      return @last_status
    end

    # Foo
    def get(command)
      send_command("get#{command}")
    end

    # Send a rcon command to the server (You need to have @rcon_password defined)
    def rcon(command, wait_after_command=false)
      fail "No rcon password given" if @rcon_password == ''

      output = send_command("rcon #{@rcon_password} #{command}")
      sleep 0.300 if wait_after_command

      return output
    end

    # Allow you to get only a part (line) from the getstatus response
    #
    # @param i [Fixnum] The line you want in the last getstatus server response
    # @return [String] The line selected in the last getstatus server response
    def get_status_parts(i)
      @last_status.split("\n")[i]
    end

    private
    def send_command(command)
      magic = "\377\377\377\377"
      @socket.send("#{magic}#{command}\n", 0)

      res = IO::select([@socket], nil, nil, @timeout)
      return false if res.nil?

      @socket.recv(2048)
    end
  end
end
