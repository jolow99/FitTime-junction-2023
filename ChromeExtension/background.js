chrome.tabs.onUpdated.addListener(function (tabId) {
  const socialMediaRegex = /(tiktok\.com|instagram\.com|facebook\.com|snapchat\.com)/;
  chrome.tabs.query({active: true, lastFocusedWindow: true}, tabs => {
    let url = tabs[0].url;
    if (socialMediaRegex.test(url)) {
      const redirectUrl = "http://localhost:3000";
      chrome.tabs.update(tabId, { url: redirectUrl });
    }
  });
});
