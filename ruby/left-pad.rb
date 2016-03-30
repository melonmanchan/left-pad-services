module LeftPad
    def LeftPad.leftPad(str, len, ch)
        str.to_s.rjust(len.to_i, ch)
    end
end
