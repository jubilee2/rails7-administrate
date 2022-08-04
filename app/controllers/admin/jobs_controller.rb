module Admin
  class JobsController < Admin::ApplicationController

    def queue
      if requested_resource.can_queue?
        requested_resource.queue!
        flash[:notice] = 'Job queued'
      else
        flash[:error] = "Job cannot be queued because it is already #{requested_resource.status}"
      end
      redirect_to after_resource_destroyed_path(requested_resource)
    end

    def destroy
      if requested_resource.can_destroy?
        super
      else
        flash[:error] = "Job cannot be deleted because it is already #{requested_resource.status}"
        redirect_to after_resource_destroyed_path(requested_resource)
      end
    end
  end
end
