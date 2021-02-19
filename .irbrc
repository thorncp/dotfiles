IRB.conf[:SAVE_HISTORY] = 1000

class Object
  def _methods(pattern = /./)
    (self.methods.sort - Object.methods).grep(pattern)
  end
end
