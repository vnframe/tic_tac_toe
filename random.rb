class Random

    attr_reader :marker
    def initialize(marker)
        @marker = marker
    end
    def get_move(ttt_board)
        valid_position = []
        ttt_board.each_with_index do |value, index_position|
            puts "This is value #{value}"
            if value.is_a?(Integer)
                #puts "Value is a integer #{index_position}"
                valid_position << index_position
            end 
        end
        valid_position.sample
    end 
end
