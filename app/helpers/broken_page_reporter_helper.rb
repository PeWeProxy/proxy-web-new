module BrokenPageReporterHelper

  def get_status_text(status)
    status_texts = {
      0 => t(:reported),
      1 => t(:pending),
      2 => t(:solved),
    }
    status_texts[status];
  end
  
end