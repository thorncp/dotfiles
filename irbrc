IRB.conf[:SAVE_HISTORY] = 1000

class Object
  def _methods(regular = true)
    self.methods(regular).sort - Object.methods
  end
end
