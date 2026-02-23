IRB.conf[:SAVE_HISTORY] = 1000

class Object
  def _methods(pattern = /./)
    (self.methods.sort - Object.methods).grep(pattern)
  end

  def _clip
    IO.popen("pbcopy", "w") { |f| f.write(self.to_s) }
    "👍"
  end

  def _caller
    caller.select { |line| line.include?(Dir.pwd) }
  end
end

def count_queries(&block)
  @query_count = 0
  query_counter = ActiveSupport::Notifications.subscribe('sql.active_record') do
    @query_count += 1
  end

  block.call

  ActiveSupport::Notifications.unsubscribe(query_counter)

  @query_count
end

class Object
  def crush
    self
  end
end

class Array
  def crush
    r = map(&:crush).compact

    r.empty? ? nil : r
  end
end

class Hash
  def crush
    r = each_with_object({ }) do |(k, v), h|
      if (_v = v.crush)
        h[k] = _v
      end
    end

    r.empty? ? nil : r
  end
end
