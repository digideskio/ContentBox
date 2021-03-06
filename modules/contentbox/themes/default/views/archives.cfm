﻿<cfoutput>
<div class="row">
	<!--- Content --->
	<div class="col-sm-9">

		<!--- ContentBoxEvent --->
		#cb.event( "cbui_preArchivesDisplay" )#

		<!--- Title --->
		<h1>Blog Archives - #prc.entriesCount# Record(s)</h1>

		<!--- Archives --->
		<cfif rc.year NEQ 0>
			<div class="alert alert-info">
				<a class="pull-right btn btn-primary btn-sm" href="#cb.linkBlog()#" title="Remove filter and view all entries">Remove Filter</a>
				
				Year: '#rc.year#'
				<cfif rc.month NEQ 0>- Month: '#rc.month#'</cfif>
				<cfif rc.day NEQ 0>- Day: '#rc.day#'</cfif>
			</div>
			<br/>
		</cfif>

		<!---
			Display Entries using ContentBox collection template rendering
			The default convention for the template is "entry.cfm" you can change it via the quickEntries() 'template' argument.
			I could have done it manually, but why?
		 --->
		#cb.quickEntries()#

		<!--- Paging via ContentBox via quick HTML, again I could have done it manually, but why? --->
		<cfif prc.entriesCount>
			<div class="contentBar">
				#cb.quickPaging()#
			</div>
		</cfif>

		<!--- ContentBoxEvent --->
		#cb.event( "cbui_postArchivesDisplay" )#
	</div>

<!--- SideBar: That's right, I can render any layout views by using quickView() or coldbox render methods --->
	<cfif args.sidebar>
	<div class="col-sm-3" id="blog-sidenav">
		#cb.quickView( view='_blogsidebar', args=args )#
	</div>
	</cfif>

</div>
</cfoutput>