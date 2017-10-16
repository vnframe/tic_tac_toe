class Player
    
        attr_accessor :marker
    
        def initialize(marker)
            @marker = marker	
        end
end
    
    class Human2 < Player
    
        attr_accessor :marker
    
    end
    
    class Sequential2 < Player
    
        attr_accessor :marker
        def get_move(board_state)
            board_state.index { |x| x.is_a?(Integer) }
        end
    
    end
    
    class Random2 < Player
    
        attr_accessor :marker
    
        def get_move(board_state)
            valid_pos = []
    
            board_state.each_with_index do |val, pos|
                if val.is_a?(Integer)
                    valid_pos.push(pos)
                end
            end
            valid_pos.sample
        end
    
    end