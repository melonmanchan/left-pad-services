require 'logger'

module LeftPad
    def LeftPad.leftPad(str, len, ch)
        log = Logger.new(STDOUT)
        i = -1

        ch ||= ' '

        len = len.to_i - str.length

        while i < len
            log.info('adadsdsadsadsa')
            str = ch + str
            i = i + 1
        end

        str
    end
end
