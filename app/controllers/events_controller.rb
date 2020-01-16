class EventsController < ApplicationController

  before_action :set_event, only: [:show, :edit, :update, :destroy]


  def index
    @events = Event.where(user_id:current_user.id)
    @now = Date.today
    now = Time.current 
    now2 = Event.select("start_date")
    @nowday = Event.where(start_date:now)
  end

  def show
    @events = Event.where(user_id:current_user.id)
    @now = Time.current 
    @now2 = Event.select("start_date")
  end

  def new
    @event = Event.new
    @events = Event.where(user_id:current_user.id)
    @now = Time.current 
    @now2 = Event.select("start_date")
  end

  def edit
    @events = Event.where(user_id:current_user.id)
    @now = Time.current 
    @now2 = Event.select("start_date")
  end

  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.'}
        format.json { render :show, status: :created, location: @event}
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit!
  end
end
