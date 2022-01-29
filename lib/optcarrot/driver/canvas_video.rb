require "js"

module Optcarrot
  # Video output driver for Web Canvas
  class CanvasVideo < Video
    def init
      super
      @palette = @palette_rgb
    end

    def dispose
    end

    def tick(screen)
      output = []
      HEIGHT.times do |y|
        WIDTH.times do |x|
          output.concat(screen[x + y * WIDTH])
          output.push(255) # alpha
        end
      end
      bin = output.pack("C*")
      File.binwrite(File.join("/OPTCARROT_TMP", File.basename(@conf.video_output, ".EXT") + ".data"), bin)
      JS::eval("globalThis.Optcarrot.tickVideo()")
      super
    rescue => e
      JS::eval("console.warn('#{ e.inspect }')")
    end
  end
end
