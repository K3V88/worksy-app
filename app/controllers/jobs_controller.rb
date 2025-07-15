class JobsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :set_job, only: [ :show, :edit, :update, :destroy ]

  # GET /jobs
  def index
    @jobs = Job.all
  end

  # GET /jobs/:id
  def show
  end

  # GET /jobs/new
  def new
    @job = current_user.jobs.build
  end

  # POST /jobs
  def create
    @job = current_user.jobs.build(job_params)
    if @job.save
      redirect_to @job, notice: "Job was successfully created."
    else
      render :new
    end
  end

  # GET /jobs/:id/edit
  def edit
  end

  # PATCH/PUT /jobs/:id
  def update
    if @job.update(job_params)
      redirect_to @job, notice: "Job was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /jobs/:id
  def destroy
    @job.destroy
    redirect_to jobs_url, notice: "Job was successfully destroyed."
  end

  private
    # Set job based on the id
    def set_job
      @job = Job.find(params[:id])
    end

    # Strong parameters for job creation
    def job_params
      params.require(:job).permit(:title, :description)
    end
end
