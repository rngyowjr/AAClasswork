class Card
    attr_accessor :face_up, :face_val
    
    def initialize(face_val)
        @face_val = face_val
        @face_up = false
    end

    def hide
        @face_up = false
    end

    def reveal
        @face_up = true
    end

    def ==(another_card)
        self.face_val == another_card.face_val
    end


end


