class JournalEntriesController < ApplicationController
  before_action :current_user_must_be_journal_entry_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_journal_entry_user
    journal_entry = JournalEntry.find(params[:id])

    unless current_user == journal_entry.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @journal_entries = JournalEntry.all

    render("journal_entries/index.html.erb")
  end

  def show
    @journal_entry = JournalEntry.find(params[:id])

    render("journal_entries/show.html.erb")
  end

  def new
    @journal_entry = JournalEntry.new

    render("journal_entries/new.html.erb")
  end

  def create
    @journal_entry = JournalEntry.new

    @journal_entry.work_hours_per_day = params[:work_hours_per_day]
    @journal_entry.sleep_hours_per_day = params[:sleep_hours_per_day]
    @journal_entry.social_connections_per_day = params[:social_connections_per_day]
    @journal_entry.user_id = params[:user_id]

    save_status = @journal_entry.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/journal_entries/new", "/create_journal_entry"
        redirect_to("/journal_entries")
      else
        redirect_back(:fallback_location => "/", :notice => "Journal entry created successfully.")
      end
    else
      render("journal_entries/new.html.erb")
    end
  end

  def edit
    @journal_entry = JournalEntry.find(params[:id])

    render("journal_entries/edit.html.erb")
  end

  def update
    @journal_entry = JournalEntry.find(params[:id])

    @journal_entry.work_hours_per_day = params[:work_hours_per_day]
    @journal_entry.sleep_hours_per_day = params[:sleep_hours_per_day]
    @journal_entry.social_connections_per_day = params[:social_connections_per_day]
    @journal_entry.user_id = params[:user_id]

    save_status = @journal_entry.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/journal_entries/#{@journal_entry.id}/edit", "/update_journal_entry"
        redirect_to("/journal_entries/#{@journal_entry.id}", :notice => "Journal entry updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Journal entry updated successfully.")
      end
    else
      render("journal_entries/edit.html.erb")
    end
  end

  def destroy
    @journal_entry = JournalEntry.find(params[:id])

    @journal_entry.destroy

    if URI(request.referer).path == "/journal_entries/#{@journal_entry.id}"
      redirect_to("/", :notice => "Journal entry deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Journal entry deleted.")
    end
  end
end
