require "js"

module Optcarrot
  # Input driver for browser input
  class BrowserInput < Input
    def init
    end

    def dispose
    end

    def tick(frame, pads)
      event = JS::eval("return globalThis.Optcarrot.fetchKeyEvent()").inspect
      return if event == ""
      code, pressed = event.split(",")
      code = code.to_i
      if pressed == "true"
        pads.keydown(0, code)
      else
        pads.keyup(0, code)
      end
    end
  end
end
