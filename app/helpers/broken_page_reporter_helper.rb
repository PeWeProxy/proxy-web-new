module BrokenPageReporterHelper

  def get_status_text(status)
    status_texts = {
      0 => "Ohlásené",
      1 => "Čaká na spracovanie",
      2 => "Vyriešené",
    }
    status_texts[status];
  end
  
end
