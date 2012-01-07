<cfoutput>
#html.startForm(action="cbinstaller/install",name="installerForm",novalidate="novalidate")#
<div class="box clear">
	<div class="header">
		<img src="#prc.assetRoot#/includes/images/help.png" alt="help" width="30" height="30" />Install Wizard
	</div>
	<div class="body_vertical_nav clearfix">
		<!--- Tabs --->
		<ul class="vertical_nav">
			<li class="active"><a href="##introduction">Introduction</a></li>
			<li><a href="##installer">Installer</a></li>
		</ul>
		<!--- Tab Content --->
		<div class="main_column">
			<div class="panes_vertical">
				
				<!--- Panel 1 --->
				<div>
					<h1>Welcome To ContentBox!</h1>
					<p>
						We have detected that your ContentBox is not setup yet, so let's get you up and running in no time.
						You have already done the first step which is created the datasource in which ContentBox will run under as you are
						now seeing this message.
						What you might not know is that we already created the entire database structure for you, we now just need
						a little information from you to get ContentBox ready for prime time.
					</p>
					<p>
						So what are you waiting for? Let's get started!
					</p>
					
					<a href="##installer">
						<input name="start" type="button" class="button2" id="start" value="Start Installer" onclick="return false;">
					</a>
				</div>
				<!--- end panel 1 --->
				
				<!--- Panel 2 : User Setup--->
				<div>
					<!--- Admin Info --->
					#html.startFieldset(legend="Administrator")#
					<p>
						Fill out the following information to setup your ContentBox administrator.
					</p>
					<!--- Fields --->
					#html.textField(name="firstName",label="First Name:",required="required",size="100",class="textfield")#
					#html.textField(name="lastName",label="Last Name:",required="required",size="100",class="textfield")#
					#html.inputField(name="email",type="email",label="Email:",required="required",size="100",class="textfield")#
					#html.textField(name="username",label="Username:",required="required",size="100",class="textfield")#
					#html.textField(name="password",label="Password:",required="required",size="100",class="textfield")#
					#html.textField(name="password_confirm",label="Confirm Password:",required="required",size="100",class="textfield")#
					#html.endFieldSet()#
					
					<!--- Site Info --->
					#html.startFieldset(legend="Site Information")#
					<p>
						Let's get some information about your site.
					</p>
					
					<!--- Populate With Sample Data --->
					#html.label(field="populatedata",content="Populate Site With Sample Data:")#
					#html.radioButton(name="populatedata",checked=true,value=true)# Yes 	
					#html.radioButton(name="populatedata",value=false)# No 	
					
					<!--- Site Name  --->
					#html.textField(name="siteName",label="Site Name:",class="textfield",size="100",title="The global name of this ContentBox installation",required="required")#
					<!--- Site Email --->
					#html.inputField(name="siteEmail",type="email",label="Administrator Email:",class="textfield",size="100",title="The email that receives all notifications from ContentBox",required="required")#
					<!--- Outgoing Email --->
					#html.inputField(name="siteOutgoingEmail",type="email",label="Outgoing Email:",class="textfield",size="100",title="The email that sends all email notifications out of ContentBox",required="required")#
					<!--- Tag Line --->
					#html.textField(name="siteTagLine",label="Site Tag Line:",class="textfield",size="100",title="A cool tag line that can appear anywhere in your site",required="required")#
					<!--- Description --->
					#html.textarea(name="siteDescription",label="Site Description:",rows="3",title="Your site description, also used in the HTML description meta tag")#		
					<!--- Keywords --->
					#html.textarea(name="siteKeywords",label="Site Keywords:",rows="3",title="A comma delimited list of keywords to be used in the HTML keywords meta tag")#		
					#html.endFieldSet()#
					
					
					<!--- URL Rewrites --->
					#html.startFieldset(legend="Site URL Rewrites")#
					<p>
						ContentBox by default is configured to work with SES (Search Engine Safe) URLs.  However, in order to remove the 
						<strong>index.cfm</strong> from your URL's you will need to configure a web server rewrite engine like
						<a href="http://httpd.apache.org/docs/current/mod/mod_rewrite.html">Apache mod_rewrite</a>, 
						<a href="http://www.tuckey.org/urlrewrite/">tuckey URL Rewrite filter</a> or 
						<a href="http://www.iis.net/download/urlrewrite">IIS 7 rewrite module</a>.  
						A fully working apache mod_rewrite <strong>.htaccess</strong> file
						has been created and placed in the root of your installation.
					</p>
					<p>
						If you select full URL rewrites below, then we will modify your application's routing table to remove the 
						<strong>index.cfm</strong> from the URLs (<em>config/routes.cfm</em>).  You can also select not to have full URL rewrites and your URLs
						will contain an <strong>index.cfm</strong> in them. 

					</p>
					<strong>Full URL Rewrite:</strong>
					<code>
						http://myapp/about-us
					</code>
					<br/>
					<strong>Default URL Rewrite</strong>
					<code>
						http://myapp/index.cfm/about-us
					</code>
					<br/><br/>
					<!--- Populate With Sample Data --->
					#html.label(field="fullrewrite",content="Enable Full URL Rewrites:")#
					#html.radioButton(name="fullrewrite",checked=true,value=true)# Yes 	
					#html.radioButton(name="fullrewrite",value=false)# No 	
					
					#html.endFieldSet()#
					
					
					<!--- Action Bar --->
					<div class="actionBar">
						#html.submitButton(name="submit",value="Start Installation!",class="buttonred",title="Let's get this party started!")#
					</div>
					
				</div> 
				<!--- end panel 2 --->
			</div>
			<!--- end panes vertical --->
		</div>
		<!--- end main column --->
	</div>
	<!--- end body content --->
</div>
<!--- end content box --->

#html.endForm()#

<script language="javascript">
$(document).ready(function() {
	// form validators
	$("##installerForm").validator({grouped:true, position:"top left"});
	$.tools.validator.fn("[name=password_confirm]", "Passwords need to match", function(el, value) {
		return (value==$("[name=password]").val()) ? true : false;
	});
});
</script>
</cfoutput>