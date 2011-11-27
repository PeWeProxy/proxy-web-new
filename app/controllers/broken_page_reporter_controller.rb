class BrokenPageReporterController < ApplicationController
  
	def report
    
  end

  def create
		if (params[:url].empty?)
      flash[:error] = "URL nesmie byť prázdna."
      #elsif (request.env['HTTP_VIA'] =~ /AdaptiveProxy/) == nil
      #  flash[:error] = "Only proxy users are allowed to report broken pages"
    elsif (params[:url] =~ /(http:\/\/)?[a-z0-9]+([-.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?/) == nil
			flash[:error] = "Zlý formát URL adresy."
		elsif BrokenPages.find_by_url(params[:url]) != nil
			flash[:error] = "O tomto probléme už vieme, ďakujeme za váš záujem."
    else
      BrokenPages.create(:url => params[:url], :uid => @uid, :timestamp => Time.now, :email => params[:email], :description => params[:post][:description])
      generate_pac
			flash[:notice] = "Problém sme zaevidovali, ďakujeme. Ak ste zadali váš email, budeme vás o zmenách informovať."
    end
    redirect_to :back
  end

  def generate_pac
    pages = BrokenPages.all
    urls_conditions = [];
    urls_condition = "";
    pages.each do |page|
      urls_conditions << 'shExpMatch(url, "'+page.url+'")'
    end
    if (not urls_conditions.empty?)
      urls_condition = urls_conditions.join(" || \n")
      urls_condition = "if ("+urls_condition+"){\nreturn \"DIRECT\";\n}"
    end


    template_file = './public/proxy.pac.template'
    target_file = './public/proxy.pac'

    mystring = ''
    File.open(template_file, "r") { |f|
      mystring = f.read
    }
    mystring['##broken_pages##'] = urls_condition

    File.open(target_file, 'w') {|f| f.write(mystring) }

    flash[:notice] = "proxy.pac generated."
  end

end
