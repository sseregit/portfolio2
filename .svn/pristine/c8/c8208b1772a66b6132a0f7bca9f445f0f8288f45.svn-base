<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <!--X-editable [ OPTIONAL ]-->
    <script src="<c:url value="plugins/x-editable/js/bootstrap-editable.min.js"/>"></script>


    <!--Bootstrap Table [ OPTIONAL ]-->
    <script src="<c:url value="plugins/bootstrap-table/bootstrap-table.min.js"/>"></script>


    <!--Bootstrap Table Extension [ OPTIONAL ]-->
    <script src="<c:url value ="plugins/bootstrap-table/extensions/editable/bootstrap-table-editable.js"/>"></script>


<script type ="text/javascript">
// EDITABLE - COMBINATION WITH X-EDITABLE
// =================================================================
// Require X-editable
// http://vitalets.github.io/x-editable/
//
// Require Bootstrap Table
// http://bootstrap-table.wenzhixin.net.cn/
//
// Require X-editable Extension of Bootstrap Table
// http://bootstrap-table.wenzhixin.net.cn/
// =================================================================
	$(document).ready(function() {
		
		// BOOTSTRAP TABLES USING FONT AWESOME ICONS
	    // =================================================================
	    // Require Bootstrap Table
	    // http://bootstrap-table.wenzhixin.net.cn/
	    //
	    // =================================================================
	    jQuery.fn.bootstrapTable.defaults.icons = {
	        paginationSwitchDown: 'demo-pli-arrow-down',
	        paginationSwitchUp: 'demo-pli-arrow-up',
	        refresh: 'demo-pli-repeat-2',
	        toggle: 'demo-pli-layout-grid',
	        columns: 'demo-pli-check',
	        detailOpen: 'demo-psi-add',
	        detailClose: 'demo-psi-remove'
	    } 
		

		
		//Tab
	$('#demo-editable').bootstrapTable({
    idField: 'seq',
    url: '<c:url value = "list.do"/>',
    columns: [{
        field: 'seq',
        title: 'seq'
    }, {
        field: 'fullName',
        title: 'Name',
        editable: {
            type: 'text'
        }
    }, {
        field: 'userName',
        title: 'username'
    }, {
        field: 'email',
        title: 'email',
        editable: {
            type: 'text'
        }
    }, {
        field: 'createDate',
        align: 'center',
        title: 'create_date',
    }, {
        field: 'lastLogin',
        title: 'last_login',
        editable: {
            type: 'text'
        }
   }, {
        field: 'reserve',
        title: 'point',
        editable: {
            type: 'text'
        }
    }]
});
	});
</script>
	<div id="page-head">
                   
		<!--Page Title-->
           <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
           <div id="page-title">
           	<h1 class="page-header text-overflow">General Elements</h1>
           </div>
           <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
           <!--End page title-->

			<!--Breadcrumb-->
			<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
			<ol class="breadcrumb">
           		<li><a href=""><i class="demo-pli-home"></i></a></li>
				<li><a href="#">Forms</a></li>
				<li class="active">General Elements</li>
       	</ol>
       	<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
       	<!--End breadcrumb-->
	</div>

    <!--Page content-->
	<!--===================================================-->
	<div id="page-content">
	                
	
	
	
		<div class="row">
		        <div class="panel">
		            <div class="panel-heading">
		                <h3 class="panel-title">Block styled form</h3>
		            </div>
		
		         
					<!--Editable - combination with X-editable-->
					<!--===================================================-->
					
					<div class="panel">
					    <div class="panel-heading">
					        <h3 class="panel-title">Editable - combination with X-editable</h3>
					    </div>
					    <div class="panel-body">
					        <table id="demo-editable"
					               data-search="true"
					               data-show-refresh="true"
					               data-show-toggle="true"
					               data-show-columns="true"
					               data-sort-name="id"
					               data-page-list="[5, 10, 20]"
					               data-page-size="10"
					               data-pagination="true" data-show-pagination-switch="true">
					        </table>
					    </div>
					</div>
					
		          
		         
		       
		    </div>
		   </div>
		   </div>