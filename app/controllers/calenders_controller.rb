class CalendersController < ApplicationController

  def index
    @events = Event.all
  end


  private

  def event_params
    params.require(:event).permit!
  end
end
