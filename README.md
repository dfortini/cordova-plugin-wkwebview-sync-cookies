# cordova-plugin-wkwebview-sync-cookies

This works around an issue in WKWebView where cookies are not readable or settable in AJAX requests on the first app install.
Executing the plugin at the specified URL will allow the server to set cookies on the client.

## Usage

This can be used as a pod dependency adding this line to a podfile:
pod 'cordova-plugin-wkwebview-sync-cookies', :git => 'https://github.com/dfortini/cordova-plugin-wkwebview-sync-cookies.git'

and on js where this is used:

for a POST
```
    post: !window.cordova
      <normal post (not from a cordova webview)>
      : (uri, data) =>
          new Promise((resolve, reject) => {
            window.cordova.exec(
              result => {
                const resultObj = JSON.parse(result);
                return (resultObj.error ? reject : resolve)(resultObj);
              },
              error => reject(JSON.parse(error)),
              "WKWebViewSyncCookies",
              "sync",
              ["POST", `${host}${uri}`, JSON.stringify(data)]
            );
          }),

```

for a GET
```
document.addEventListener('deviceready', () => {
  const args = ['GET', 'https://my.site.com'];
  cordova.exec(null, null, 'WKWebViewSyncCookies', 'sync', args);
});

```
