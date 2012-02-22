class MoveUidController < ApplicationController
  def store
    if (params[:identifier].empty?)
      flash[:error] = "you must choose an identifier!"
    elsif (!StoredUid.find_by_identifier(params[:identifier]).nil?)
      flash[:error] = "sorry, this identifier is already taken"
    else
      StoredUid.create(:identifier => params[:identifier], :uid => "123456", :valid_until => Date.today + 30)
    end
    redirect_to :back
  end

  def retrieve_uid
    @back = params[:back]
    if(params[:identifier].empty?)
      flash[:error] = "missing identifier for retrieval"
      redirect_to :back and return
    end
    retrieved_uid = StoredUid.find_by_identifier(params[:identifier])
    if(retrieved_uid.nil?)
      flash[:error] = "Did not find an UID with identifier \'#{params[:identifier]}\' in the database."
      redirect_to :back and return;
    end

    @retrieved_uid = retrieved_uid.uid
    @back = "/"
    render('set_cookie/retrieve_cookie')

    retrieved_uid.destroy unless params[:leave_uid] == "1"
  end

end