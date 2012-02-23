class MoveUidController < ApplicationController
  def store
    if (params[:identifier].empty?)
      flash[:store_error] = t(:you_must_choose_a_code)
    elsif (!StoredUid.find_by_identifier(params[:identifier]).nil?)
      flash[:store_error] = t(:identifier_is_taken)
    else
      StoredUid.create(:identifier => params[:identifier], :uid => @uid, :valid_until => Date.today + 30)
    end
    redirect_to :back
  end

  def retrieve_uid
    @back = params[:back]
    if(params[:identifier].empty?)
      flash[:retrieve_error] = t(:missing_code_for_retrieval)
      redirect_to :back and return
    end
    retrieved_uid = StoredUid.find_by_identifier(params[:identifier])
    if(retrieved_uid.nil?)
      flash[:retrieve_error] = "#{t(:identifier_not_found)} \'#{params[:identifier]}\'"
      redirect_to :back and return;
    end

    @retrieved_uid = retrieved_uid.uid
    @back = "/"
    render('set_cookie/retrieve_cookie')

    retrieved_uid.destroy unless params[:leave_uid] == "1"
  end

end