class LogsController < ApplicationController
  CouchPotato::Config.database_name = 'proxy'

  LOGS_PER_PAGE = 20

  def list
    session[:apuid] = "123"
    @logs = CouchPotato.database.view AccessLog.by_user_and_timestamp(:startkey => [session[:apuid], params[:start]], :startkey_docid => params[:start_id], :limit => LOGS_PER_PAGE + 1)

    last_log = @logs.pop
		if last_log
			@next_page_startkey = last_log.timestamp
			@next_page_startkey_docid = last_log.id
		end
  end

  def delete_many
    if params[:for_deletion].nil?
      #TODO: display some error message
      redirect_to :action => :list
      return
    end

    params[:for_deletion].each do |doc_for_deletion|
      doc = CouchPotato.database.load_document(doc_for_deletion)
      log = AccessLog.new :id => doc.id, :_rev => doc.rev
      CouchPotato.database.destroy_document log
    end

    #TODO: display some "done" message
    redirect_to :action => :list
  end
end
