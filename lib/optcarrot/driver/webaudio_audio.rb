require "js"

module Optcarrot
  # Audio output driver for Web Audio API
  class WebAudioAudio < Audio
    def tick(output)
      bin = output.pack(@pack_format)
      File.binwrite(File.join("/OPTCARROT_TMP/audio.data"), bin)
      JS::eval("globalThis.Optcarrot.tickAudio()")
    rescue => e
      JS::eval("console.warn('#{ e.inspect }')")
    end
  end
end
