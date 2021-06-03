var cordova = require('cordova');

/**
 * Clipboard plugin for Cordova
 * 
 * @constructor
 */
function FacebookSocialShare () {}

/**
 * Sets the sharing context with App IP and Background Image
 *
 * @param {Number}   appId      			The content to copy to the clipboard
 * @param {Number}   backgroundImage      	The content to copy to the clipboard
 * @param {Function} onSuccess 				The function to call in case of success (takes the copied text as argument)
 * @param {Function} onFail    				The function to call in case of error
 */
FacebookSocialShare.prototype.share = function (appId, backgroundImage, onSuccess, onFail) {
    //if (typeof text === "undefined" || text === null) text = "";
	cordova.exec(onSuccess, onFail, "Clipboard", "copy", [appId, backgroundImage]);
};

// Register the plugin
var facebookSocialShare = new FacebookSocialShare();
module.exports = facebookSocialShare;
