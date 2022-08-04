class Job < Delayed::Job
  def queue! now = Time.current
    update! run_at: now if can_queue?
  end

  def status
    case
    when failed_at
      'failed'
    when locked_at && locked_by
      'executing'
    else
      'queued'
    end
  end

  def can_destroy?
    status != 'executing'
  end

  def can_queue?
    status != 'executing'
  end
end
