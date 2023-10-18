var SocialMedia = function () {


    return {
        //main function to initiate the module
        init: function () 
		
		{
				/*<![CDATA[*/
			jQuery(function($) {
			var msie = navigator.appVersion.toLowerCase();
			msie = (msie.indexOf('msie')>-1) ? parseInt(msie.replace(/.*msie[ ]/,'').match(/^[0-9]+/)) : 0;
			if (msie == 0 || msie >= 8) {
				$('#sns-share').show();
				// google plus one
				window.___gcfg = {
					lang: 'pt_BR'
				};
				(function() {
					var po = document.createElement('script');
					po.type = 'text/javascript';
					po.async = true;
					po.src = 'https://apis.google.com/js/plusone.js';
					var s = document.getElementsByTagName('script')[0];
					s.parentNode.insertBefore(po, s);
				})();
				// twitter
				!function(d,s,id){
					var js,fjs=d.getElementsByTagName(s)[0],
					p=/^http:/.test(d.location)?'http':'https';
					if(!d.getElementById(id)){
						js=d.createElement(s);
						js.id=id;
						js.async=true;
						js.src=p+'://platform.twitter.com/widgets.js';
						fjs.parentNode.insertBefore(js,fjs);
					}
				}(document, 'script', 'twitter-wjs');
				// facebook
				(function(d, s, id) {
				  var js, fjs = d.getElementsByTagName(s)[0];
				  if (d.getElementById(id)) return;
				  js = d.createElement(s); js.id = id;
				  js.src = "//connect.facebook.net/pt_BR/sdk.js#xfbml=1&version=v2.5";
				  fjs.parentNode.insertBefore(js, fjs);
				}(document, 'script', 'facebook-jssdk'));
				
			}

					
			});
			/*]]>*/

		}
		
	};	

}();