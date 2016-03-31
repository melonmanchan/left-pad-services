module LeftPad
    def LeftPad.leftPad(str, len, ch)
        i = 0

        ch ||= ' '

        len = len.to_i - str.length

        while i < len
            str = ch + str
            i = i + 1
        end

        str

    end
end
