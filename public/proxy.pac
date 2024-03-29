function FindProxyForURL(url,host) {

  var PROXY = "PROXY peweproxy-staging.fiit.stuba.sk:9666; DIRECT"

 if(shExpMatch(url, "ftp://*")) {
   return "DIRECT";
 }

  if(shExpMatch(url, "*activity/update*") ||
     shExpMatch(url, "*set_cookie/cookie.js*")) {
    return PROXY;
  }

  if (shExpMatch(url, "*.css") ||
      shExpMatch(url, "*.css?*") ||
      shExpMatch(url, "*.js") ||
      shExpMatch(url, "*.js?*") ||
      shExpMatch(url, "*.jpg") ||
      shExpMatch(url, "*.jpg?*") ||
      shExpMatch(url, "*.jpeg") ||
      shExpMatch(url, "*.jpeg?*") ||
      shExpMatch(url, "*.gif") ||
      shExpMatch(url, "*.gif?*") ||
      shExpMatch(url, "*.png") ||
      shExpMatch(url, "*.png?*") ||
      shExpMatch(url, "*.ico") ||
      shExpMatch(url, "*.ico?*") ||
      shExpMatch(url, "*.swf") ||
      shExpMatch(url, "*.swf?*") ||
      shExpMatch(url, "*.jar") ||
      shExpMatch(url, "*.class") ||
      shExpMatch(url, "*.xap") ||
      shExpMatch(url, "*.svc") ||
      shExpMatch(url, "*.svg") ||
      shExpMatch(url, "*.svg?*") ||
      shExpMatch(url, "*.zip") ||
      shExpMatch(url, "*.pdf") ||
      shExpMatch(url, "*.doc") ||
      shExpMatch(url, "*.ppt") ||
      shExpMatch(url, "*.xls") ||
      shExpMatch(url, "*.exe")) {
    return "DIRECT";
  }

  if (shExpMatch(url,"https://*")) {
    return "DIRECT";
  }

  return PROXY;
}
